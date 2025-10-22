package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// Get the FS Bucket path from environment or use local path for development
		String uploadPath = getUploadPath();

		registry.addResourceHandler("/uploads/**").addResourceLocations(uploadPath).setCachePeriod(3600);

		registry.setOrder(1);
	}

	private String getUploadPath() {
		// Check if running on Clever Cloud
		String bucketPath = System.getenv("CC_FS_BUCKET");

		if (bucketPath != null && !bucketPath.isEmpty()) {
			// Running on Clever Cloud with FS Bucket
			System.out.println("Using Clever Cloud FS Bucket: " + bucketPath);
			return "file:" + bucketPath + "/uploads/";
		} else {
			// Running locally for development
			System.out.println("Using local uploads directory");
			return "file:./uploads/";
		}
	}

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
}
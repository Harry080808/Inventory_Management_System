package com.example.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
public class S3Config {

	@Value("${cellar.addon.host}")
	private String cellarHost;

	@Value("${cellar.addon.key.id}")
	private String accessKey;

	@Value("${cellar.addon.key.secret}")
	private String secretKey;

	@Value("${cellar.bucket.name}")
	private String bucketName;

	@Bean
	public AmazonS3 amazonS3() {
		if (accessKey == null || accessKey.isEmpty()) {
			System.out.println("⚠ Cellar not configured - using local storage");
			return null;
		}

		BasicAWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);

		AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(
						new AwsClientBuilder.EndpointConfiguration("https://" + cellarHost, "us-east-1"))
				.withCredentials(new AWSStaticCredentialsProvider(credentials)).withPathStyleAccessEnabled(true)
				.build();

		try {
			if (!s3Client.doesBucketExistV2(bucketName)) {
				s3Client.createBucket(bucketName);
				System.out.println("✓ Created bucket: " + bucketName);
			}
		} catch (Exception e) {
			System.err.println("⚠ Error with bucket: " + e.getMessage());
		}

		System.out.println("✓ Cellar S3 configured successfully");
		return s3Client;
	}

	public String getBucketName() {
		return bucketName;
	}
}
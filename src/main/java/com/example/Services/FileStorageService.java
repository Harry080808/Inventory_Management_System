package com.example.Services;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.example.config.S3Config;

@Service
public class FileStorageService {

	@Autowired(required = false)
	private AmazonS3 amazonS3;

	@Autowired
	private S3Config s3Config;

	public String uploadFile(MultipartFile file) throws IOException {
		if (amazonS3 != null) {
			return uploadToS3(file);
		} else {
			return uploadToLocal(file);
		}
	}

	private String uploadToS3(MultipartFile file) throws IOException {
		String fileName = generateFileName(file.getOriginalFilename());
		String bucketName = s3Config.getBucketName();

		try (InputStream inputStream = file.getInputStream()) {
			ObjectMetadata metadata = new ObjectMetadata();
			metadata.setContentLength(file.getSize());
			metadata.setContentType(file.getContentType());

			PutObjectRequest request = new PutObjectRequest(bucketName, fileName, inputStream, metadata);

			request.setCannedAcl(CannedAccessControlList.PublicRead);
			amazonS3.putObject(request);

			String fileUrl = amazonS3.getUrl(bucketName, fileName).toString();
			System.out.println("✓ Uploaded to Cellar: " + fileUrl);
			return fileUrl;

		} catch (Exception e) {
			System.err.println("⚠ S3 upload error: " + e.getMessage());
			throw new IOException("Failed to upload file", e);
		}
	}

	private String uploadToLocal(MultipartFile file) throws IOException {
		String uploadDir = "./uploads/";
		File directory = new File(uploadDir);

		if (!directory.exists()) {
			directory.mkdirs();
		}

		String fileName = generateFileName(file.getOriginalFilename());
		String filePath = uploadDir + fileName;

		File destinationFile = new File(filePath);
		file.transferTo(destinationFile);

		System.out.println("✓ Uploaded locally: " + filePath);
		return "/uploads/" + fileName;
	}

	private String generateFileName(String originalFilename) {
		String extension = "";
		if (originalFilename != null && originalFilename.contains(".")) {
			extension = originalFilename.substring(originalFilename.lastIndexOf("."));
		}
		return UUID.randomUUID().toString() + extension;
	}

	public void deleteFile(String fileUrl) {
		if (amazonS3 != null && fileUrl.contains(s3Config.getBucketName())) {
			try {
				String fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
				amazonS3.deleteObject(s3Config.getBucketName(), fileName);
				System.out.println("✓ Deleted from Cellar: " + fileName);
			} catch (Exception e) {
				System.err.println("⚠ Delete error: " + e.getMessage());
			}
		}
	}
}
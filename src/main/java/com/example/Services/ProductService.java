package com.example.Services;

import java.io.File;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.Model.Product;
import com.example.Repository.ProductRepo;

@Service
public class ProductService {
	@Autowired
	private ProductRepo productrep;

	public List<Product> getAllProducts() {
		return productrep.findAll();
	}

	public void saveProduct(String name, double price, int quantity, MultipartFile imagePath) {
		try {
			String uploadDir = "C:/uploads/";
			// uploads folder banaye agar exist nahi hai
//			File uploadDir = new File("uploads");
//			if (!uploadDir.exists()) {
//				uploadDir.mkdir();
//			}

			// file ko save karo
			String fileName = imagePath.getOriginalFilename();
			File filePath = new File(uploadDir, fileName);
			imagePath.transferTo(filePath);

			// Product object banao
			Product product = new Product();
			product.setName(name);
			product.setPrice(price);
			product.setQuantity(quantity);
			product.setImagePath(fileName);

			// database save
			productrep.save(product);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteproduct(int id) {
		productrep.deleteById(id);
	}

	public Optional<Product> editById(int id) {
		return Optional.ofNullable(productrep.findById(id).orElse(null));
	}

	public void updateProductById(int id, String name, double price, int quantity, MultipartFile imagePath) {
		Product product = productrep.findById(id).orElseThrow();

		product.setName(name);
		product.setPrice(price);
		product.setQuantity(quantity);

		// Agar naya image upload hua hai
		if (imagePath != null && !imagePath.isEmpty()) {
			try {
				File uploadDir = new File("uploads");
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				String fileName = imagePath.getOriginalFilename();
				File filePath = new File(uploadDir, fileName);
				imagePath.transferTo(filePath);

				product.setImagePath(fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		productrep.save(product);
	}
}

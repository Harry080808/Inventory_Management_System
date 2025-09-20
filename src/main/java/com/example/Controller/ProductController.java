package com.example.Controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.Model.Order;
import com.example.Model.Product;
import com.example.Repository.OrderRepo;
import com.example.Services.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService pServ;
	@Autowired
	private OrderRepo orderrep;

	@GetMapping("/products")
	public String showProductsPage(Model m) {
		List<Product> pro = pServ.getAllProducts();
		m.addAttribute("products", pro);
		return "Products";
	}

	@PostMapping("/products/save")
	public String saveProduct(@RequestParam("name") String name, @RequestParam("price") double price,
			@RequestParam("quantity") int quantity, @RequestParam("imagePath") MultipartFile imagePath,
			RedirectAttributes redirectAttributes) throws IOException {

		try {
			pServ.saveProduct(name, price, quantity, imagePath);
			redirectAttributes.addFlashAttribute("success", "Product saved successfully!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Failed to save product: " + e.getMessage());
		}

		return "redirect:/products";
	}

	@GetMapping("/addProductPage")
	public String addProductPage() {
		return "AddProduct"; // yeh tumhara AddProduct.jsp render karega
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		pServ.deleteproduct(id);
		return "redirect:/products";
	}

	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") int id, Model m) {
		Product product = pServ.editById(id).orElseThrow(() -> new RuntimeException("Product not found"));
		m.addAttribute("edit_product", product);
		return "editProduct";
	}

	@PostMapping("/edit/{id}")
	public String updateProduct(@PathVariable("id") int id, @RequestParam("name") String name,
			@RequestParam("price") double price, @RequestParam("quantity") int quantity,
			@RequestParam(value = "imagePath", required = false) MultipartFile imagePath) {
		pServ.updateProductById(id, name, price, quantity, imagePath);
		return "redirect:/products";
	}

	@GetMapping("/backadmin")
	public String displayAdmin() {
		return "AdminPage";
	}

	@GetMapping("/backlogin")
	public String displayLogin() {
		return "login";
	}

	@GetMapping("/orders")
	public String customerOrders(@ModelAttribute("Order") Order o, Model m) {
		List<Order> orders = orderrep.findAll(); // returns List<Order>
		m.addAttribute("CustomerO", orders);
		return "ViewOrders";
	}

	@GetMapping("/ViewOrders")
	public String customerNewOrders(@ModelAttribute("Order") Order o, Model m) {
		List<Order> orders = orderrep.findAll(); // returns List<Order>
		m.addAttribute("CustomerO", orders);
		return "ViewOrders";
	}

	@PostMapping("/deleteOrder")
	public String deleteOrder(@RequestParam int id) {
		orderrep.deleteById(id);
		return "redirect:/ViewOrders";
	}

}

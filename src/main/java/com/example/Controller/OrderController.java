package com.example.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Model.Order;
import com.example.Model.OrderProducts;
import com.example.Model.Product;
import com.example.Repository.OrderProRepo;
import com.example.Repository.OrderRepo;
import com.example.Repository.ProductRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	@Autowired
	ProductRepo productrep;
	@Autowired
	OrderRepo Orderrepo;
	@Autowired
	OrderProRepo orderprore;

	@PostMapping("/Placeorder")
	public String pOrder(@RequestParam int productId, Model m, @RequestParam int quantity, HttpSession session) {
		Product product = productrep.findById(productId).orElse(null);
		int userId = (int) session.getAttribute("userId");
		if (product != null) {
			Order o = new Order();
			o.setProductId(productId);
			o.setQuantity(quantity);
			o.setUserId(userId);
			Orderrepo.save(o);
			m.addAttribute("orderId", o.getId());
			OrderProducts orPro = new OrderProducts();
			orPro.setPro_name(product.getName());
			orPro.setPro_quantity(quantity);
			orPro.setPro_imagepath(product.getImagePath());
			orPro.setPro_price(product.getPrice() * quantity);
			orderprore.save(orPro);
			product.setQuantity(product.getQuantity() - quantity);
			m.addAttribute("orderProid", orPro.getId());
		}
		return "Res";
	}

	@GetMapping("/deleteOrder")
	public String deleteOrder(@RequestParam("id") int id) {
		orderprore.deleteById(id);
		return "Orderhistory"; // redirect back to order history page
	}

	@GetMapping("/orderhistory")
	public String YourHistory(Model m) {
		List<OrderProducts> orderedProducts = orderprore.findAll();
		m.addAttribute("orderedPro", orderedProducts);
		return "Orderhistory";
	}
}

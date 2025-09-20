package com.example.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Model.Product;
import com.example.Model.User;
import com.example.Services.ProductService;
import com.example.Services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	User user;
	@Autowired
	private ProductService productservice;

	@GetMapping("/")
	public String indexPage() {
		return "index";
	}

	// UserController.java
	@PostMapping("/Registration")
	public String reg(@ModelAttribute("user") User u) {
		userService.saveUser(u);
		return "login"; // Redirects to the home page or another valid path
	}

	@GetMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, Model m, HttpSession session) {

		User e = userService.findUserByEmail(email);

		// check if user exists and password matches
		if (e != null && e.getPassword().equals(password)) {

			// if admin → redirect to AdminPage
			if ("admin".equalsIgnoreCase(e.getRole())) {
				session.setAttribute("user", e); // optional: store whole user in session
				session.setAttribute("userId", e.getId());
				return "AdminPage";
			}

			// else normal user → show products
			List<Product> listOfProducts = productservice.getAllProducts();
			m.addAttribute("List_Pro", listOfProducts);

			session.setAttribute("user", e); // store whole user
			session.setAttribute("userId", e.getId()); // store only id if you need later

			return "ordersMain";

		} else {
			// invalid login → show error
			m.addAttribute("error", "Invalid email or password");
			return "login";
		}
	}

}

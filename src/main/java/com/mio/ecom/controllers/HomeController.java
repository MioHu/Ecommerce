package com.mio.ecom.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mio.ecom.global.GlobalData;
import com.mio.ecom.models.LoginUser;
import com.mio.ecom.models.Product;
import com.mio.ecom.models.User;
import com.mio.ecom.services.ProductService;
import com.mio.ecom.services.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String home(HttpSession session, Model model) {
		// if login, show Logout in navbar
		// if not login, show Register and Login in navbar
		boolean login = true;
		if(session.getAttribute("userId") == null) {
			login = false;
		}
		
		List<Product> products = productService.getAllProduct();
		model.addAttribute("products", products);
		model.addAttribute("cartCount", GlobalData.cart.size());
		model.addAttribute("login", login);
		return "home.jsp";
	}
	
	@GetMapping("/register")
	public String register(Model model, HttpSession session) {
		model.addAttribute("newUser", new User());
		model.addAttribute("cartCount", GlobalData.cart.size());
		return "register.jsp";
	}
	
	@GetMapping("/login")
	public String login(Model model, HttpSession session) {
		model.addAttribute("newLogin", new LoginUser());
		model.addAttribute("cartCount", GlobalData.cart.size());
		return "login.jsp";
	}
	
	@PostMapping("/registerPost")
	public String registerPost(
			@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result,
			Model model,
			HttpSession session) {
		User regUser = userService.register(newUser, result);
		if(result.hasErrors()) {
			return "register.jsp";
		}
		session.setAttribute("userId", regUser.getId());
		session.setAttribute("role", regUser.getRole());
		return "redirect:/";
	}
	
	@PostMapping("/loginPost")
	public String loginPost(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result,
			Model model,
			HttpSession session) {
		User loginUser = userService.login(newLogin, result);
		if(result.hasErrors()) {
			return "login.jsp";
		}
		session.setAttribute("userId", loginUser.getId());
		session.setAttribute("userName", loginUser.getUserName());
		session.setAttribute("role", loginUser.getRole());
		
		if(session.getAttribute("role").equals("admin")) {
			return "redirect:/admin";
		} else {
			return "redirect:/";			
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		GlobalData.cart.clear();
		return "redirect:/";
	}
}

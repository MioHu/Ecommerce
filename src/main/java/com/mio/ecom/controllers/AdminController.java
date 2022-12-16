package com.mio.ecom.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mio.ecom.models.Order;
import com.mio.ecom.models.Product;
import com.mio.ecom.services.OrderService;
import com.mio.ecom.services.ProductService;

@Controller
public class AdminController {
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	private static String uploadDir = System.getProperty("user.dir") + "/src/main/resources/static/productImages";
	
	@GetMapping("/admin")
	public String adminHome(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null ||
				!session.getAttribute("role").equals("admin")) {
			return "redirect:/";
		}
		return "adminHome.jsp";
	}
	
	@GetMapping("/admin/products")
	public String adminProduct(Model model) {
		model.addAttribute("products", productService.getAllProduct());
		return "adminProduct.jsp";
	}
	
	@GetMapping("/admin/products/add")
	public String productAddForm(
			@ModelAttribute("product") Product product,
			HttpSession session) {
		if(session.getAttribute("userId") == null ||
				!session.getAttribute("role").equals("admin")) {
			return "redirect:/";
		}
		return "productAdd.jsp";
	}
	@PostMapping("/admin/products/add")
	public String productAdd(
			@ModelAttribute("product") Product product,
			@RequestParam("prodImg") MultipartFile file) throws IOException {
		String imgUUID = file.getOriginalFilename();
		Path fileNameAndPath = Paths.get(uploadDir, imgUUID);
		Files.write(fileNameAndPath, file.getBytes());
		product.setImgName(imgUUID);
		productService.create(product);
		return "redirect:/admin/products";
	}
	
	@DeleteMapping("/admin/products/delete/{id}")
	public String productDelete(@PathVariable("id") Long id) {
		// delete the image
		Product product = productService.findProduct(id);
		Path path = Paths.get(uploadDir, product.getImgName());
		File file = new File(path.toUri());
		file.delete();
		// delete in db
		productService.remove(id);
		return "redirect:/admin/products";
	}
	
	@GetMapping("/admin/products/update/{id}")
	public String productUpdateForm(@PathVariable("id") Long id, Model model) {
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		return "productUpdate.jsp";
	}
	@PutMapping("/admin/products/update/{id}")
	public String productUpdate(@ModelAttribute("prodcut") Product product) {
		productService.create(product);
		return "redirect:/admin/products";
	}
	
	@GetMapping("/admin/orders")
	public String adminOrder(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null ||
				!session.getAttribute("role").equals("admin")) {
			return "redirect:/";
		}
		List<Order> orders = orderService.getAllOrderWithProduct();
		model.addAttribute("orders", orders);
		return "adminOrder.jsp";
	}
}

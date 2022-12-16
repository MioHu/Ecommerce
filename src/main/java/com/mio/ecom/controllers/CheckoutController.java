package com.mio.ecom.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mio.ecom.global.GlobalData;
import com.mio.ecom.models.Order;
import com.mio.ecom.models.OrderProduct;
import com.mio.ecom.models.Product;
import com.mio.ecom.models.User;
import com.mio.ecom.services.OrderProductService;
import com.mio.ecom.services.OrderService;
import com.mio.ecom.services.UserService;

@Controller
public class CheckoutController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderProductService orderProductService;
	@Autowired
	private UserService usesrService;
	
	@GetMapping("/checkout")
	public String checkout(
			Model model, HttpSession session,
			@ModelAttribute("order") Order order) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		
		model.addAttribute("cartCount", GlobalData.cart.size());
		model.addAttribute("total", GlobalData.cart.stream().mapToDouble(Item -> Item.getPrice()*Item.getQuantity()).sum());
		model.addAttribute("cart", GlobalData.cart);
		
		// country API
		String url = "https://restcountries.com/v2/all";
		RestTemplate restTemplate = new RestTemplate();
		Object[] result = restTemplate.getForObject(url, Object[].class);
		List<Object> result1 = Arrays.asList(result);
		ArrayList<String> countries = new ArrayList<String>();
		ObjectMapper mapObj = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<>();
		for(int i=0; i<result1.size(); i++) {
			map = mapObj.convertValue(result1.get(i), HashMap.class);
			countries.add(map.get("name").toString());
		}
		model.addAttribute("countries",countries);
		
		return "checkout.jsp";
	}
	
	@PostMapping("/checkoutPost")
	public String checkoutPost(@ModelAttribute("order") Order order, HttpSession session) {
		User buyer = usesrService.findUser((Long) session.getAttribute("userId"));
		order.setUser(buyer);
		order.setTotal(GlobalData.cart.stream().mapToDouble(Item -> Item.getPrice()*Item.getQuantity()).sum());
		orderService.create(order);
		for(Product p:GlobalData.cart) {
			OrderProduct newOP = new OrderProduct(order, p);
			orderProductService.create(newOP);
		}
		GlobalData.cart.clear();
		return "redirect:/order";
	}
	
	@GetMapping("/order")
	public String order(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/login";
		}
		List<Order> orders = orderService.getOrderByUserId((Long) session.getAttribute("userId"));
		model.addAttribute("orders", orders);
		model.addAttribute("cartCount", GlobalData.cart.size());
		return "order.jsp";
	}
}

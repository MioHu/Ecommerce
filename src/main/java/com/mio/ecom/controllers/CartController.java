package com.mio.ecom.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mio.ecom.global.GlobalData;
import com.mio.ecom.models.Product;
import com.mio.ecom.services.ProductService;

@Controller
public class CartController {
@Autowired ProductService productService;
	
	@PostMapping("/addToCart")
	public String addCart(@RequestParam(value="id") Long id) {
		Product product = productService.findProduct(id);
		int idx =  isExist(id, GlobalData.cart);
		if(idx == -1) {
			product.setQuantity(1);
			GlobalData.cart.add(product);			
		} else {
			int quan = GlobalData.cart.get(idx).getQuantity() + 1;
			GlobalData.cart.get(idx).setQuantity(quan);
		}
		return "redirect:/";
	}
	private int isExist(Long id, List<Product> cart) {
		for(int i=0; i<cart.size(); i++) {
			if(cart.get(i).getId() == id){
				return i;				
			}
		}
		return -1;
	}
	
	@GetMapping("/cart")
	public String cartGet(Model model, HttpSession session) {
		model.addAttribute("cartCount", GlobalData.cart.size());
		model.addAttribute("total", GlobalData.cart.stream().mapToDouble(Item -> Item.getPrice()*Item.getQuantity()).sum());
		model.addAttribute("cart", GlobalData.cart);
		
		boolean login = true;
		if(session.getAttribute("userId") == null) {
			login = false;
		}
		model.addAttribute("login", login);
		return "cart.jsp";
	}
	
	@DeleteMapping("/cart/remove/{id}")
	public String cartRemove(@PathVariable("id") Long id) {
		int idx = isExist(id, GlobalData.cart);
		if(GlobalData.cart.get(idx).getQuantity() == 1) {
			GlobalData.cart.remove(idx);			
		} else {
			int quan = GlobalData.cart.get(idx).getQuantity() - 1 ;
			GlobalData.cart.get(idx).setQuantity(quan);
		}
		return "redirect:/cart";
	}
	
	@PostMapping("/buyItAgain")
	public String buyItAgain(@RequestParam(value="id") Long id) {
		Product product = productService.findProduct(id);
		int idx =  isExist(id, GlobalData.cart);
		if(idx == -1) {
			product.setQuantity(1);
			GlobalData.cart.add(product);			
		} else {
			int quan = GlobalData.cart.get(idx).getQuantity() + 1;
			GlobalData.cart.get(idx).setQuantity(quan);
		}
		return "redirect:/order";
	}
}

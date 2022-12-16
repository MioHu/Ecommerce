package com.mio.ecom.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mio.ecom.models.Product;
import com.mio.ecom.repositories.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	public List<Product> getAllProduct(){
		return productRepository.findAll();
	}
	
	public Product create(Product product) {
		return productRepository.save(product);
	}
	
	public void remove(Long id) {
		productRepository.deleteById(id);
	}
	
	public Product findProduct(Long id){
		Optional<Product> productOptional = productRepository.findById(id);
		if(productOptional.isPresent()) {
			return productOptional.get();
		} else {
			return null;
		}
	}
}

package com.mio.ecom.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mio.ecom.models.OrderProduct;
import com.mio.ecom.repositories.OrderProductRepository;

@Service
public class OrderProductService {
	@Autowired
	private OrderProductRepository orderProductRepository;
	
	public List<OrderProduct> getAllOrderProduct(){
		return orderProductRepository.findAll();
	}
	public OrderProduct create(OrderProduct orderProduct) {
		return orderProductRepository.save(orderProduct);
	}
}

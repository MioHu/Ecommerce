package com.mio.ecom.services;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mio.ecom.models.Order;
import com.mio.ecom.models.Product;
import com.mio.ecom.repositories.OrderRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	
	public Order create(Order order) {
		return orderRepository.save(order);
	}
	
	public List<Order> getOrderByUserId(Long id){
		List<Object[]> result = orderRepository.getOrderByUserId(id);
		List<Order> allOrders = new ArrayList<>();
		
		// orderId for oneOrder
		Long orderId = convertId(result.get(0)[0]);
		// initial oneOrder
		Order oneOrder = new Order();
		oneOrder.setUser(userService.findUser(id));
		oneOrder.setId(orderId);
		oneOrder.setCity((String) result.get(0)[1]);
		oneOrder.setCountry((String) result.get(0)[2]);
		oneOrder.setCreatedAt((Date) result.get(0)[3]);
		oneOrder.setFirstName((String) result.get(0)[4]);
		oneOrder.setLastName((String) result.get(0)[5]);
		oneOrder.setLine1((String) result.get(0)[6]);
		oneOrder.setLine2((String) result.get(0)[7]);
		oneOrder.setNote((String) result.get(0)[8]);
		oneOrder.setPhone((String) result.get(0)[9]);
		oneOrder.setState((String) result.get(0)[10]);
		oneOrder.setTotal((double) result.get(0)[11]);
		oneOrder.setUpdatedAt((Date) result.get(0)[12]);
		oneOrder.setZip((String) result.get(0)[13]);
		// products for oneOrder
		List<Product> productArr = new ArrayList<>();
		
		for(Object[] row:result) {
			Long currentOrderId = convertId(row[0]);
			if(currentOrderId.equals(orderId)) {
				Product product = productService.findProduct(convertId(row[16]));
				product.setQuantity((int) row[17]);
				productArr.add(product);
			} else {
				oneOrder.setProducts(productArr);
				allOrders.add(oneOrder);
				
				orderId = currentOrderId;
				
				productArr = new ArrayList<>();
				Product product = productService.findProduct(convertId(row[16]));
				product.setQuantity((int) row[17]);
				productArr.add(product);
				
				oneOrder = new Order();
				oneOrder.setUser(userService.findUser(id));
				oneOrder.setId(orderId);
				oneOrder.setCity((String) row[1]);
				oneOrder.setCountry((String) row[2]);
				oneOrder.setCreatedAt((Date) row[3]);
				oneOrder.setFirstName((String) row[4]);
				oneOrder.setLastName((String) row[5]);
				oneOrder.setLine1((String) row[6]);
				oneOrder.setLine2((String) row[7]);
				oneOrder.setNote((String) row[8]);
				oneOrder.setPhone((String) row[9]);
				oneOrder.setState((String) row[10]);
				oneOrder.setTotal((double) row[11]);
				oneOrder.setUpdatedAt((Date) row[12]);
				oneOrder.setZip((String) row[13]);
			}
		}
		oneOrder.setProducts(productArr);
		allOrders.add(oneOrder);
		return allOrders;
	}
	// convert sql id object -> bigint -> long
	private Long convertId(Object id) {
		BigInteger bid = (BigInteger) id;
		Long lid = bid.longValue();
		return lid;
	}
	
	public List<Order> getAllOrderWithProduct(){
		List<Object[]> result = orderRepository.getAllOrderWithProduct();
		List<Order> allOrders = new ArrayList<>();
		
		// orderId for oneOrder
		Long orderId = convertId(result.get(0)[0]);
		// initial oneOrder
		Order oneOrder = new Order();
		oneOrder.setUser(userService.findUser(convertId(result.get(0)[14])));
		oneOrder.setId(orderId);
		oneOrder.setCity((String) result.get(0)[1]);
		oneOrder.setCountry((String) result.get(0)[2]);
		oneOrder.setCreatedAt((Date) result.get(0)[3]);
		oneOrder.setFirstName((String) result.get(0)[4]);
		oneOrder.setLastName((String) result.get(0)[5]);
		oneOrder.setLine1((String) result.get(0)[6]);
		oneOrder.setLine2((String) result.get(0)[7]);
		oneOrder.setNote((String) result.get(0)[8]);
		oneOrder.setPhone((String) result.get(0)[9]);
		oneOrder.setState((String) result.get(0)[10]);
		oneOrder.setTotal((double) result.get(0)[11]);
		oneOrder.setUpdatedAt((Date) result.get(0)[12]);
		oneOrder.setZip((String) result.get(0)[13]);
		// products for oneOrder
		List<Product> productArr = new ArrayList<>();
		
		for(Object[] row:result) {
			Long currentOrderId = convertId(row[0]);
			if(currentOrderId.equals(orderId)) {
				Product product = productService.findProduct(convertId(row[16]));
				product.setQuantity((int) row[17]);
				productArr.add(product);
			} else {
				oneOrder.setProducts(productArr);
				allOrders.add(oneOrder);
				
				orderId = currentOrderId;
				
				productArr = new ArrayList<>();
				Product product = productService.findProduct(convertId(row[16]));
				product.setQuantity((int) row[17]);
				productArr.add(product);
				
				oneOrder = new Order();
				oneOrder.setUser(userService.findUser(convertId(row[14])));
				oneOrder.setId(orderId);
				oneOrder.setCity((String) row[1]);
				oneOrder.setCountry((String) row[2]);
				oneOrder.setCreatedAt((Date) row[3]);
				oneOrder.setFirstName((String) row[4]);
				oneOrder.setLastName((String) row[5]);
				oneOrder.setLine1((String) row[6]);
				oneOrder.setLine2((String) row[7]);
				oneOrder.setNote((String) row[8]);
				oneOrder.setPhone((String) row[9]);
				oneOrder.setState((String) row[10]);
				oneOrder.setTotal((double) row[11]);
				oneOrder.setUpdatedAt((Date) row[12]);
				oneOrder.setZip((String) row[13]);
			}
		}
		oneOrder.setProducts(productArr);
		allOrders.add(oneOrder);
		return allOrders;
	}
}

package com.mio.ecom.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.mio.ecom.models.Order;

public interface OrderRepository extends CrudRepository<Order, Long> {
	@Query(value="SELECT * FROM orders JOIN order_product ON orders.id=order_product.order_id WHERE user_id=:uid", nativeQuery = true)
	List<Object[]> getOrderByUserId(Long uid);
	
	@Query(value="SELECT * FROM orders JOIN order_product ON orders.id=order_product.order_id", nativeQuery = true)
	List<Object[]> getAllOrderWithProduct();
}

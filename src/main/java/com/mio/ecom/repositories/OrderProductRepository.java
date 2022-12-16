package com.mio.ecom.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.mio.ecom.models.OrderProduct;

public interface OrderProductRepository extends CrudRepository<OrderProduct, Long> {
	List<OrderProduct> findAll();
}

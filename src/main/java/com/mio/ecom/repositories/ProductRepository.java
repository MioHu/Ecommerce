package com.mio.ecom.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.mio.ecom.models.Product;

public interface ProductRepository extends CrudRepository<Product, Long> {
	List<Product> findAll();
}

package com.mio.ecom.models;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "order_product")
public class OrderProduct {
	@EmbeddedId
	private OrderProductKey id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("order_id")
	@JoinColumn(name = "order_id")
	private Order order;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("prouct_id")
	@JoinColumn(name = "product_id")
	private Product product;
	
	private int quantity;
	
	// constructor
	public OrderProduct() {}
	public OrderProduct(Order order, Product product) {
		this.id = new OrderProductKey(order.getId(), product.getId()); // must set id manually
		this.order = order;
		this.product = product;
		this.quantity = product.getQuantity();
	}
	
	// getters, setters
	public OrderProductKey getId() {
		return id;
	}
	public void setId(OrderProductKey id) {
		this.id = id;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}

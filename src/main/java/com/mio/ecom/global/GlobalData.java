package com.mio.ecom.global;

import java.util.ArrayList;
import java.util.List;

import com.mio.ecom.models.Product;

public class GlobalData {
	public static List<Product> cart;
	static {
		cart = new ArrayList<>();
	}
}

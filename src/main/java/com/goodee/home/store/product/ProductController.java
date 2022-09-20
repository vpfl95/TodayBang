package com.goodee.home.store.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@GetMapping("add")
	public String setProduct() throws Exception {
		return "store/products/addProduct";
	}
}
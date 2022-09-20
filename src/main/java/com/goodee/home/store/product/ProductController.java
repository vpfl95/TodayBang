package com.goodee.home.store.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;

	@GetMapping("add")
	public String setProduct() throws Exception {
		return "store/products/addProduct";
	}
	
	@GetMapping("category")
	@ResponseBody
	public List<CategoryDTO> getCategory() throws Exception {
		return productService.getCategory();
	}
}
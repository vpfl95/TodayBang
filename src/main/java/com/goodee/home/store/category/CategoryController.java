package com.goodee.home.store.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("get")
	@ResponseBody
	public List<CategoryDTO> getCategory() throws Exception {
		return categoryService.getCategory();
	}
	
	@GetMapping("main")
	public String categoryMain() throws Exception {
		return "/store/category/category";
	}
}

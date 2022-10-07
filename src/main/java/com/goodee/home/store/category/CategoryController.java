package com.goodee.home.store.category;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	public String categoryMain(String category) throws Exception {
		return "/store/category/category";
	}
	
	@GetMapping("setSide")
	@ResponseBody
	public ModelAndView setSide(String category) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<CategoryDTO> tier1 = categoryService.getTier1();
		List<CategoryDTO> cateDetail = categoryService.getCateDetail(category);
		CategoryDTO categoryDTO = new CategoryDTO();
		for(CategoryDTO dto : tier1) {
			if(dto.getCategoryNum().equals(category)) {
				categoryDTO = dto;
			}
		}
		mv.addObject("tier1", tier1);
		mv.addObject("categoryDTO", categoryDTO);
		mv.addObject("cateDetail", cateDetail);
		mv.setViewName("store/category/categorySide");
		return mv;
	}
}

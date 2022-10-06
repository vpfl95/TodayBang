package com.goodee.home.store.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	public List<CategoryDTO> getCategory() throws Exception {
		return categoryDAO.getCategory();
	}
	
	public int setCategory(Cate_ProductDTO cate_ProductDTO) throws Exception {
		return categoryDAO.setCategory(cate_ProductDTO);
	}
}

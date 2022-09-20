package com.goodee.home.store.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.store.exhibition.ExhibitionDAO;
import com.goodee.home.store.exhibition.ExhibitionDTO;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ExhibitionDAO exhibitionDAO;

	public List<CategoryDTO> getCategory() throws Exception {
		return productDAO.getCategory();
	}
	
	public List<ExhibitionDTO> getExhibition() throws Exception {
		return exhibitionDAO.getExhibition();
	}
}
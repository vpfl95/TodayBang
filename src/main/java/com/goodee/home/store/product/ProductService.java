package com.goodee.home.store.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.store.exhibition.Ex_ProductDTO;
import com.goodee.home.store.exhibition.ExhibitionDAO;
import com.goodee.home.store.impl.OptionDTO;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ExhibitionDAO exhibitionDAO;
	
	public int setProduct(ProductDTO productDTO) throws Exception {
		return productDAO.setProduct(productDTO);
	}

	public List<CategoryDTO> getCategory() throws Exception {
		return productDAO.getCategory();
	}
	
	public int setCategory(Cate_ProductDTO cate_ProductDTO) throws Exception {
		return productDAO.setCategory(cate_ProductDTO);
	}
	
	public int setOption(String[] optionName, Long[] optionPrice, Long productNum,int num) throws Exception {
		int result=0;
		for(int i=0; i<optionName.length; i++) {
			if(!optionName[i].equals("")) {
				OptionDTO optionDTO = new OptionDTO();
				optionDTO.setOptionName(optionName[i]);
				optionDTO.setOptionPrice(optionPrice[i]);
				optionDTO.setProductNum(productNum);
				result += productDAO.setOption(optionDTO, num);
			}
		}
		return result;
	}
	
	public int setExhibition(Ex_ProductDTO ex_ProductDTO) throws Exception {
		int result=0;
		if(ex_ProductDTO.getExhibitionCode() != 0) {
			result = exhibitionDAO.setExhibition(ex_ProductDTO);
		}
		return result;
	}
}
package com.goodee.home.store.product;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.home.store.exhibition.Ex_ProductDTO;
import com.goodee.home.store.exhibition.ExhibitionDAO;
import com.goodee.home.store.exhibition.ExhibitionDTO;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ExhibitionDAO exhibitionDAO;
	
	public int setProduct(ProductDTO productDTO) throws Exception {
		return productDAO.setProduct(productDTO);
	}
	
	public int setOption(String[] optionName, Long[] optionPrice, Long productNum,int num) throws Exception {
		int result=0;
		for(int i=0; i<optionName.length; i++) {
			if(!optionName[i].equals("")) {
				ProductOptionDTO productOptionDTO = new ProductOptionDTO();
				productOptionDTO.setOptionName(optionName[i]);
				productOptionDTO.setOptionPrice(optionPrice[i]);
				productOptionDTO.setProductNum(productNum);
				productOptionDTO.setOptionDiv(num);
				result += productDAO.setOption(productOptionDTO);
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
	
	public int setProductImage(MultipartFile[] files, ServletContext servletContext, Long productNum, long num) throws Exception {
		int result=0;
		String realPath = servletContext.getRealPath("resources/upload/store/product");
		System.out.println(realPath);
		for(MultipartFile photo : files) {
			if(!photo.isEmpty()) {
				File file = new File(realPath);
				if(!file.exists()) file.mkdirs();
				String fileName = UUID.randomUUID().toString();
				fileName += photo.getOriginalFilename();
				file = new File(file, fileName);
				photo.transferTo(file);
				
				ProductImageDTO productImageDTO = new ProductImageDTO();
				productImageDTO.setProductNum(productNum);
				productImageDTO.setFileName(fileName);
				productImageDTO.setOriName(photo.getOriginalFilename());
				productImageDTO.setDetail(num);
				result += productDAO.setProductImage(productImageDTO);
			}
		}
		
		return result;
	}
	
	public List<ProductDTO> getExProductList(ExhibitionDTO exhibitionDTO) throws Exception {
		return productDAO.getExProductList(exhibitionDTO);
	}
	
	public List<ProductDTO> getProductDetail(ProductDTO productDTO) throws Exception {
		return productDAO.getProductDetail(productDTO);
	}
	
	public List<ProductDTO> getProductList() throws Exception {
		return productDAO.getProductList();
	}
	
	public ProductDTO getOptionDetail(ProductDTO productDTO) throws Exception {
		return productDAO.getOptionDetail(productDTO);
	}
	
	public List<ProductDTO> getCateItem(String category) throws Exception {
		return productDAO.getCateItem(category);
	}
}
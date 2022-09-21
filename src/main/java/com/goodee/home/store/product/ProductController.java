package com.goodee.home.store.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.home.store.exhibition.Ex_ProductDTO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;

	@GetMapping("add")
	public String getAddProductPage() throws Exception {
		return "store/products/addProduct";
	}
	
	@PostMapping("add")
	public String setProduct(ProductDTO productDTO, Cate_ProductDTO cate_ProductDTO, Ex_ProductDTO ex_ProductDTO,
			String[] optionName, String[] optionName2, String[] optionName3,
			Long[] optionPrice, Long[] optionPrice2, Long[] optionPrice3,
			MultipartFile[] productDetail, MultipartFile[] productImage) throws Exception {
		
//		productService.setProduct(productDTO);
//		productService.setCategory(cate_ProductDTO);
		
		productService.setOption(optionName, optionPrice, productDTO.getProductNum(), 1);
		productService.setOption(optionName2, optionPrice2, productDTO.getProductNum(), 2);
		productService.setOption(optionName3, optionPrice3, productDTO.getProductNum(), 3);
		productService.setExhibition(ex_ProductDTO);
		
		
		return "redirect:./add";
	}
	
	@GetMapping("category")
	@ResponseBody
	public List<CategoryDTO> getCategory() throws Exception {
		return productService.getCategory();
	}
}
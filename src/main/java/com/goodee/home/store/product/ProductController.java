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
	public String setProduct(Cate_ProductDTO cate_ProductDTO, Ex_ProductDTO ex_ProductDTO,
			String[] optionName, String[] optionName1, String[] optionName2,
			String[] optionPrice, String[] optionPrice1, String[] optionPrice2,
			MultipartFile[] productDetail, MultipartFile[] productImage) throws Exception {
		System.out.println("test");
		return "redirect:./add";
	}
	
	@GetMapping("category")
	@ResponseBody
	public List<CategoryDTO> getCategory() throws Exception {
		return productService.getCategory();
	}
}
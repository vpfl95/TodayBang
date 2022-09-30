package com.goodee.home.store.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodee.home.store.exhibition.Ex_ProductDTO;
import com.goodee.home.store.exhibition.ExhibitionDTO;

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
			MultipartFile[] productDetail, MultipartFile[] productImage, HttpSession httpSession) throws Exception {
		
		productService.setProduct(productDTO);
		productService.setCategory(cate_ProductDTO);
		productService.setOption(optionName, optionPrice, productDTO.getProductNum(), 1);
		productService.setOption(optionName2, optionPrice2, productDTO.getProductNum(), 2);
		productService.setOption(optionName3, optionPrice3, productDTO.getProductNum(), 3);
		productService.setExhibition(ex_ProductDTO);
		productService.setProductImage(productImage, httpSession.getServletContext(), productDTO.getProductNum(), 0);
		productService.setProductImage(productDetail, httpSession.getServletContext(), productDTO.getProductNum(), 1);
		
		return "redirect:./add";
	}
	
	@GetMapping("category")
	@ResponseBody
	public List<CategoryDTO> getCategory() throws Exception {
		return productService.getCategory();
	}
	
	@GetMapping("list")
	@ResponseBody
	public List<ProductDTO> getExProductList(ExhibitionDTO exhibitionDTO) throws Exception {
		List<ProductDTO> ar = productService.getExProductList(exhibitionDTO);
		return ar;
	}
	
	@GetMapping("detail")
	public ModelAndView getProductDetail(ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> ar = productService.getProductDetail(productDTO);
		ObjectMapper mapper = new ObjectMapper();
		String jsonList = mapper.writeValueAsString(ar);
		mv.addObject("jsonList", jsonList);
		mv.setViewName("store/products/detailProduct");
		return mv;
	}
}
package com.goodee.home.store.product;

import java.util.ArrayList;
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
import com.goodee.home.store.category.Cate_ProductDTO;
import com.goodee.home.store.category.CategoryService;
import com.goodee.home.store.exhibition.Ex_ProductDTO;
import com.goodee.home.store.exhibition.ExhibitionDTO;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

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
		categoryService.setCategory(cate_ProductDTO);
		productService.setOption(optionName, optionPrice, productDTO.getProductNum(), 1);
		productService.setOption(optionName2, optionPrice2, productDTO.getProductNum(), 2);
		productService.setOption(optionName3, optionPrice3, productDTO.getProductNum(), 3);
		productService.setExhibition(ex_ProductDTO);
		productService.setProductImage(productImage, httpSession.getServletContext(), productDTO.getProductNum(), 0);
		productService.setProductImage(productDetail, httpSession.getServletContext(), productDTO.getProductNum(), 1);
		
		return "redirect:./add";
	}
	
	@GetMapping("ex_list")
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
	
	@GetMapping("list")
	@ResponseBody
	public List<ProductDTO> getProductList() throws Exception {
		return productService.getProductList();
	}
	
	@GetMapping("option")
	@ResponseBody
	public ModelAndView getOptionDetail(ProductDTO productDTO, Long[] option1List, Long[] option2List, Long[] option3List) throws Exception {
		int result=0;
		ModelAndView mv = new ModelAndView();
		ProductDTO dto = productService.getOptionDetail(productDTO);
		if(dto.getOption1DTOs().size() != 0) {			
			if(dto.getOption1DTOs().get(0).getOptionPrice() == -2 || dto.getOption1DTOs().get(0).getOptionPrice() == -3) result=1;
		}
		if(dto.getOption2DTOs().size() != 0) {			
			if(dto.getOption2DTOs().get(0).getOptionPrice() == -2 || dto.getOption2DTOs().get(0).getOptionPrice() == -3) result=1;
		}
		if(dto.getOption3DTOs().size() != 0) {			
			if(dto.getOption3DTOs().get(0).getOptionPrice() == -2 || dto.getOption3DTOs().get(0).getOptionPrice() == -3) result=1;
		}
		
		Integer price = (int) (dto.getPrice() * (100 - dto.getSaleRate())/100);
		int totalPrice=0;
		if(result == 0) {
			totalPrice = price;			
		}
		
		List<Option1DTO> op1List = new ArrayList<Option1DTO>();
		List<Option2DTO> op2List = new ArrayList<Option2DTO>();
		List<Option3DTO> op3List = new ArrayList<Option3DTO>();
		for(Long op1 : option1List) {
			for(Option1DTO op1DTO : dto.getOption1DTOs()) {
				if(op1DTO.getNum().equals(op1)) {
					op1List.add(op1DTO);
					totalPrice += op1DTO.getOptionPrice();
				}
			}
		}
		for(Long op2 : option2List) {
			for(Option2DTO op2DTO : dto.getOption2DTOs()) {
				if(op2DTO.getNum().equals(op2)) {
					op2List.add(op2DTO);
					totalPrice += op2DTO.getOptionPrice();
				}
			}
		}
		for(Long op3 : option3List) {
			for(Option3DTO op3DTO : dto.getOption3DTOs()) {
				if(op3DTO.getNum().equals(op3)) {
					op3List.add(op3DTO);
					totalPrice += op3DTO.getOptionPrice();
				}
			}
		}
		mv.addObject("dto", dto);
		mv.addObject("result", result);
		mv.addObject("price", price);
		mv.addObject("option1", op1List);
		mv.addObject("option2", op2List);
		mv.addObject("option3", op3List);
		mv.addObject("totalPrice", totalPrice);
		mv.setViewName("/store/products/option");
		return mv;
	}
	
	@GetMapping("cateItem")
	@ResponseBody
	public List<ProductDTO> cateItem(String category) throws Exception {
		return productService.getCateItem(category);
	}
}
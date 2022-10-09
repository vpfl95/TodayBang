package com.goodee.home.store.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
			String[] optionName1, String[] optionName2, String[] optionName3,
			Long[] optionPrice1, Long[] optionPrice2, Long[] optionPrice3,
			MultipartFile[] productDetail, MultipartFile[] productImage, HttpSession httpSession) throws Exception {
		
		productService.setProduct(productDTO);
		categoryService.setCategory(cate_ProductDTO);
		productService.setOption(optionName1, optionPrice1, productDTO.getProductNum(), 1);
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
	public ModelAndView getOptionDetail(ProductDTO productDTO, Long[] optionList) throws Exception {
		int result=0; int op2=0; int op3=0;
		ModelAndView mv = new ModelAndView();
		ProductDTO dto = productService.getOptionDetail(productDTO);
		if(dto.getProductOptionDTOs().size() != 0) {			
			for(ProductOptionDTO optionDTO : dto.getProductOptionDTOs()) {
				if(optionDTO.getOptionPrice() == -2) {
					result=1;
				}
			}
		}
		
		Integer price = (int) (dto.getPrice() * (100 - dto.getSaleRate())/100);
		int totalPrice=0;
		if(result == 0) {
			totalPrice = price;			
		}
		
		List<ProductOptionDTO> productOptionDTOs = new ArrayList<ProductOptionDTO>();
		for(Long option : optionList) {
			for(ProductOptionDTO productOptionDTO : dto.getProductOptionDTOs()) {
				if(productOptionDTO.getOptionNum().equals(option)) {
					productOptionDTOs.add(productOptionDTO);
					totalPrice += productOptionDTO.getOptionPrice();
				}
			}
		}
		for(ProductOptionDTO productOptionDTO : dto.getProductOptionDTOs()) {
			if(productOptionDTO.getOptionDiv().equals(2)) {
				op2=1;
			}
			if(productOptionDTO.getOptionDiv().equals(3)) {
				op3=1;
			}
		}
		mv.addObject("dto", dto);
		mv.addObject("result", result);
		mv.addObject("price", price);
		mv.addObject("op2", op2);
		mv.addObject("op3", op3);
		mv.addObject("options", productOptionDTOs);
		mv.addObject("totalPrice", totalPrice);
		mv.setViewName("/store/products/option");
		return mv;
	}
	
	@GetMapping("cateItem")
	@ResponseBody
	public List<ProductDTO> cateItem(String category) throws Exception {
		return productService.getCateItem(category);
	}
	
	@GetMapping("todayDeal")
	public String setTodayDeals() throws Exception {
		List<ProductDTO> ar = productService.getTodayDealSub();
		productService.minusTodayDeal();
		int result = 0;
		Random random = new Random();
		for(int i=0; i<5; i++) {
			result += productService.setTodayDeal(ar.get(random.nextInt(ar.size())));
		}
		return "redirect:/";
	}
	
	@GetMapping("today_list")
	@ResponseBody
	public List<ProductDTO> getTodayDealList() throws Exception {
		return productService.getTodayDealList();
	}
}
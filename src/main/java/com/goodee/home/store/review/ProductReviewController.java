package com.goodee.home.store.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review/*")
public class ProductReviewController {
	
	@Autowired
	private ProductReviewService productReviewService;
	
	@PostMapping("add")
	@ResponseBody
	public int addReview(@RequestParam("fileObj") MultipartFile file, ProductReviewDTO productReviewDTO, HttpSession httpSession) throws Exception {
		return productReviewService.addReview(productReviewDTO, file, httpSession.getServletContext());
	}
	
	@GetMapping("list")
	@ResponseBody
	public ModelAndView getList(ProductReviewDTO productReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductReviewDTO> ar = productReviewService.getReview(productReviewDTO);
		List<Long> grade = productReviewService.getGrade(productReviewDTO);
		mv.addObject("list", ar);
		mv.addObject("grade", grade);
		mv.setViewName("store/review/list");
		return mv;
	}
}
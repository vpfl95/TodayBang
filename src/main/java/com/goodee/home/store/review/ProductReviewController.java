package com.goodee.home.store.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
}
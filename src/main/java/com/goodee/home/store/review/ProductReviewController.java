package com.goodee.home.store.review;

import java.util.ArrayList;
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

import com.goodee.home.member.MemberDTO;
import com.goodee.home.util.FileManger;

@Controller
@RequestMapping("/review/*")
public class ProductReviewController {
	
	@Autowired
	private ProductReviewService productReviewService;
	
	@Autowired
	private FileManger fileManger;
	
	@PostMapping("add")
	@ResponseBody
	public int addReview(@RequestParam(value="fileObj", required = false) MultipartFile file, ProductReviewDTO productReviewDTO, HttpSession httpSession) throws Exception {
		return productReviewService.addReview(productReviewDTO, file, httpSession.getServletContext());
	}
	
	@GetMapping("list")
	@ResponseBody
	public ModelAndView getList(ProductReviewDTO productReviewDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductReviewDTO> ar = productReviewService.getReview(productReviewDTO);
		List<ReviewLikeDTO> chkHelp = new ArrayList<ReviewLikeDTO>();
		List<Long> grade = productReviewService.getGrade(productReviewDTO);
		List<Long> totalCount = new ArrayList<Long>();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		for(ProductReviewDTO dto : ar) {
			ReviewLikeDTO reviewLikeDTO = new ReviewLikeDTO();
			reviewLikeDTO.setRevNum(dto.getRevNum());
			Long count = productReviewService.getHelpCount(reviewLikeDTO);
			totalCount.add(count);
			if(memberDTO != null) {
				reviewLikeDTO.setUserId(memberDTO.getUserId());
				reviewLikeDTO = productReviewService.getHelp(reviewLikeDTO);
				chkHelp.add(reviewLikeDTO);
			} else {
				chkHelp = null;
			}
		}
		double totalGrade = (grade.get(0)+(grade.get(1)*2)+(grade.get(2)*3)+(grade.get(3)*4)+(grade.get(4)*5))/(double) grade.get(5);
		totalGrade = (int) (totalGrade*10);
		totalGrade = totalGrade/10;
		mv.addObject("list", ar);
		mv.addObject("grade", grade);
		mv.addObject("totalCount", totalCount);
		mv.addObject("chkHelp", chkHelp);
		mv.addObject("totalGrade", totalGrade);
		mv.addObject("type", productReviewDTO.getType());
		mv.setViewName("store/review/list");
		return mv;
	}
	
	@PostMapping("help")
	@ResponseBody
	public int setHelp(ReviewLikeDTO reviewLikeDTO) throws Exception {
		int result = 0;
		ReviewLikeDTO dto = productReviewService.getHelp(reviewLikeDTO);
		if(dto == null) {
			result = 1;
			productReviewService.setHelp(reviewLikeDTO);
		} else {
			productReviewService.deleteHelp(reviewLikeDTO);
		}
		return result;
	}
	
	@GetMapping("detail")
	@ResponseBody
	public ProductReviewDTO getDetail(ProductReviewDTO productReviewDTO) throws Exception {
		return productReviewService.getReviewDetail(productReviewDTO);
	}
	
	@PostMapping("delete")
	@ResponseBody
	public boolean deleteReview(ProductReviewDTO productReviewDTO, HttpSession session) throws Exception {
		productReviewDTO = productReviewService.getReviewDetail(productReviewDTO);
		productReviewService.deleteHelpAll(productReviewDTO);
		int result = productReviewService.deleteReview(productReviewDTO);
		if(result == 1 && productReviewDTO.getFileName() != null) {
			return fileManger.deleteFile(productReviewDTO.getFileName(), session.getServletContext(), "/resources/upload/store/review");
		}
		return false;
	}
	
	@PostMapping("update")
	@ResponseBody
	public int updateReview(@RequestParam(value="fileObj", required = false) MultipartFile file, ProductReviewDTO productReviewDTO, HttpSession httpSession) throws Exception {
		return productReviewService.updateReview(productReviewDTO, file, httpSession.getServletContext());
	}
}
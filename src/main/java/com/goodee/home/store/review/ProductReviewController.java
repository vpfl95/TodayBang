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
		List<HelpDTO> chkHelp = new ArrayList<HelpDTO>();
		List<Long> grade = productReviewService.getGrade(productReviewDTO);
		List<Long> totalCount = new ArrayList<Long>();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		for(ProductReviewDTO dto : ar) {
			HelpDTO helpDTO = new HelpDTO();
			helpDTO.setRevNum(dto.getRevNum());
			Long count = productReviewService.getHelpCount(helpDTO);
			if(memberDTO != null) {
				helpDTO.setUserId(memberDTO.getUserId());
				helpDTO = productReviewService.getHelp(helpDTO);
				totalCount.add(count);
				chkHelp.add(helpDTO);
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
		mv.setViewName("store/review/list");
		return mv;
	}
	
	@PostMapping("help")
	@ResponseBody
	public int setHelp(HelpDTO helpDTO) throws Exception {
		int result = 0;
		HelpDTO dto = productReviewService.getHelp(helpDTO);
		if(dto == null) {
			result = 1;
			productReviewService.setHelp(helpDTO);
		} else {
			productReviewService.deleteHelp(helpDTO);
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
		System.out.println(productReviewDTO.getFileName());
		int result = productReviewService.deleteReview(productReviewDTO);
		if(result == 1 && productReviewDTO.getFileName() != null) {
			return fileManger.deleteFile("/resources/upload/store/review", session.getServletContext(), productReviewDTO.getFileName());
		}
		return false;
	}
}
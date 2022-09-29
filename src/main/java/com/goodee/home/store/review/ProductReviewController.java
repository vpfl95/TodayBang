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
		mv.addObject("list", ar);
		mv.addObject("grade", grade);
		mv.addObject("totalCount", totalCount);
		mv.addObject("chkHelp", chkHelp);
		
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
}
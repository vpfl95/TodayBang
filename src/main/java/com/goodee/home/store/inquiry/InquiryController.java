package com.goodee.home.store.inquiry;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/inquiry/*")
public class InquiryController {

	@Autowired
	private InquiryService inquiryService;
	
	@PostMapping("add")
	@ResponseBody
	public int addInquiry(InquiryDTO inquiryDTO) throws Exception {
		return inquiryService.addInquiry(inquiryDTO);
	}
	
	@GetMapping("list")
	@ResponseBody
	public ModelAndView getInquiryList(InquiryDTO inquiryDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<InquiryDTO> ar = inquiryService.getInauiryList(inquiryDTO);
		List<InquiryDTO> reply = new ArrayList<InquiryDTO>();
		List<Long> reStatus = new ArrayList<Long>();
		for(InquiryDTO dto : ar) {
			InquiryDTO replyDTO = inquiryService.getReply(dto);
			reply.add(replyDTO);
			if(replyDTO == null) {
				reStatus.add(0L);
			} else {
				reStatus.add(1L);
			}
		}
		mv.addObject("list", ar);
		mv.addObject("reply", reply);
		mv.addObject("reStatus", reStatus);
		mv.setViewName("store/inquiry/list");
		return mv;
	}
	
	@PostMapping("delete")
	@ResponseBody
	public int deleteInquiry(InquiryDTO inquiryDTO) throws Exception {
		InquiryDTO replyDTO = inquiryService.getReply(inquiryDTO);
		inquiryService.deleteInquiry(replyDTO);
		return inquiryService.deleteInquiry(inquiryDTO);
	}
	
	@PostMapping("reply")
	@ResponseBody
	public int replyInquiry(InquiryDTO inquiryDTO) throws Exception {
		return inquiryService.replyInquiry(inquiryDTO);
	}
}
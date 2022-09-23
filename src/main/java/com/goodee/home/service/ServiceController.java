package com.goodee.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/service/*")
public class ServiceController {

	@Autowired
	private ServiceService service;
	
	
	@GetMapping("notice")
	public ModelAndView getNotice() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<NoticeDTO> ar = service.getNotice();
		
		
		
		mv.addObject("notice",ar);
		mv.setViewName("service/notice");
		
		return mv;
	}
	
	@GetMapping("noticeDetail")
	public ModelAndView getNoticeDetail(NoticeDTO noticeDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		noticeDTO  = service.getNoticeDetail(noticeDTO);
		
		
		mv.addObject("notice",noticeDTO);
		mv.setViewName("service/noticeDetail");
		
		return mv;
	}
	
	
	
	@GetMapping("qna")
	public void getQna() throws Exception{
		
		
	}
	
	
}

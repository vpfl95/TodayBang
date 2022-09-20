package com.goodee.home.service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service/*")
public class ServiceController {

	@GetMapping("notice")
	public void getNotice() throws Exception{
		
		
		
	}
	
	@GetMapping("qna")
	public void getQna() throws Exception{
		
		
	}
	
	
}

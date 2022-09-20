package com.goodee.home.community;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	@GetMapping("home")
	public void getCommunityHome() throws Exception{
		
		
		
		
	}
	
	
}

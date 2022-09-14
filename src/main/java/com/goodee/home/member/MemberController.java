package com.goodee.home.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	
	@GetMapping("login")
	public void getLogin() throws Exception{
		System.out.println("로그인 실행");
		
		
	}
	
	
	@GetMapping("join")
	public void getJoin() throws Exception{
		System.out.println("회원가입 실행");
		
		
	}
	
	
}

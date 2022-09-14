package com.goodee.home.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService = new MemberService();
	
	@GetMapping("login")
	public void getLogin() throws Exception{
		System.out.println("로그인 페이지 실행");
		
	}
	
	@PostMapping("login")
	public void getLogin(MemberDTO memberDTO) throws Exception{
		System.out.println("로그인 DB 실행");
		
		memberDTO = memberService.getLogin(memberDTO);
		
		if (memberDTO != null) {
			System.out.println(memberDTO.getEmail());
			System.out.println("로그인 성공");
		}
		
		
		
	}
	
	
	
	
	
	@GetMapping("join")
	public void getJoin() throws Exception{
		System.out.println("회원가입 실행");
		
		
	}
	
	
}

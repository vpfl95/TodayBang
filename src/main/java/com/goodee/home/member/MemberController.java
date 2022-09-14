package com.goodee.home.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView getLogin(HttpSession session,MemberDTO memberDTO) throws Exception{
		System.out.println("로그인 DB 실행");
		ModelAndView mv = new ModelAndView();
		
		
		memberDTO = memberService.getLogin(memberDTO);
		
		if (memberDTO != null) {
			System.out.println(memberDTO.getEmail());
			System.out.println("로그인 성공");
		}
		
		session.setAttribute("member", mv);
		
		
		
		mv.setViewName("/home");
		
		
		return mv;
	}
	
	@GetMapping("logout")
	public String getLogout(HttpSession session) throws Exception{
		System.out.println("로그아웃");
		
		session.invalidate();
		
		return "redirect:../";
	}
	
	
	
	@GetMapping("join")
	public void getJoin() throws Exception{
		System.out.println("회원가입 실행");
		
		
	}
	
	
}

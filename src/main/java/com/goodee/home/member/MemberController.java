package com.goodee.home.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService = new MemberService();
	
	@GetMapping("login")
	public void getLogin() throws Exception{
	
		
	}
	
	@PostMapping("login")
	public ModelAndView getLogin(HttpSession session,MemberDTO memberDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getLogin(memberDTO);

		
		if (memberDTO != null) {
			System.out.println("not null");
			session.setAttribute("member", mv);
			mv.setViewName("/home");
			
		}else {
			System.out.println("null");
			
			String url = "./login";
			String msg = "존재하지 않는 계정 입니다.";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("common/message");
		}
		
		
		return mv;
	}
	
	@GetMapping("logout")
	public String getLogout(HttpSession session) throws Exception{
		
		
		session.invalidate();
		
		return "redirect:../";
	}
	
	
	
	@GetMapping("join")
	public void getJoin() throws Exception{
		
		
		
	}
	@PostMapping("join")
	public String getJoin(MemberDTO memberDTO) throws Exception{
		
		
		int result = memberService.getJoin(memberDTO);
		
		if(result==1) {
			System.out.println("회원가입 성공 ㅋㅋ");
		}
		
		return "redirect:../";
		
	}
	
	@GetMapping("joinCheck")
	public void getJoinCheck() throws Exception{
		
	}
	
	@PostMapping("joinOverlab")
	@ResponseBody
	public String getJoinOverlab(MemberDTO memberDTO) throws Exception{
		
		memberDTO = memberService.getJoinOverlab(memberDTO);
		
		
		
		
		if(memberDTO != null) {
			// 사용 불가
			return "0";
			
		}
		
		
		// 사용 가능
		return "1";
	}
	
	
	
}

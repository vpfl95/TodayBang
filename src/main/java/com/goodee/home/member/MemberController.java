package com.goodee.home.member;

import java.util.List;

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
			
			session.setAttribute("member", memberDTO);
			mv.setViewName("/home");
			
		}else {
			
			String url = "./login";
			String msg = "존재하지 않는 계정 입니다.";
			mv.addObject("msg",msg);
			mv.addObject("url",url);
			mv.setViewName("common/message");
		}
		
		
		return mv;
	}
	
	
	@GetMapping("naverLogin")
	public ModelAndView getNaverLogin(HttpSession session,MemberDTO memberDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		System.out.println(" Naver login");
		
		session.setAttribute("member", mv);
		
		mv.setViewName("member/naverLogin");
		
		
		
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
	
	@PostMapping("updateOverlab")
	@ResponseBody
	public String getUpdateOverlab(MemberDTO memberDTO,HttpSession session) throws Exception{
		
		
		
		memberDTO = memberService.getJoinOverlab(memberDTO);
		MemberDTO memberDTO2 = (MemberDTO) session.getAttribute("member");
		
		
		if(memberDTO != null && !memberDTO.getNickname().equals(memberDTO2.getNickname()) ) {
			// 사용 불가
		
			return "0";
			
		}
		// 사용 가능
		return "1";
	}
	
	@GetMapping("myPage")
	public ModelAndView getMyPage(HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	
		mv.addObject("memberDTO", memberDTO);
		mv.setViewName("member/myPage");
		
		
		return mv;
	}
	
	
	@GetMapping("profile")
	public void getProfile(HttpSession session) throws Exception{
		
		
		
		MemberDTO memberDTO =(MemberDTO) session.getAttribute("member");
		
		
	}
	@GetMapping("rank")
	public void getRank() throws Exception{
		
		
		
	}
	
	
	@PostMapping("update")
	public String setUpdate(MemberDTO memberDTO,HttpSession session) throws Exception{
		
		memberService.setUpdate(memberDTO);
		MemberDTO memberDTO2 =  (MemberDTO) session.getAttribute("member");
		memberDTO.setPassword(memberDTO2.getPassword());
		session.setAttribute("member",memberDTO);
		
		return "redirect:./myPage";
	}
	
	@GetMapping("updatePw")
	public void getUpdatePw() throws Exception{
			
	}
	
	@PostMapping("updatePw")
	public String setUpdatePw(MemberDTO memberDTO,HttpSession session) throws Exception{
		
		memberService.setUpdatePw(memberDTO);
		
		MemberDTO memberDTO2 =  (MemberDTO) session.getAttribute("member");
		memberDTO2.setPassword(memberDTO.getPassword());
		session.setAttribute("member",memberDTO2);
		
		return "redirect:./myPage";
	}
	
	
	@GetMapping("delivery")
	public ModelAndView getDelivery(HttpSession session,int num) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<DeliveryDTO> ar =memberService.getDelivey(memberDTO);
		
		if(ar.size() != 0) {
			
			mv.addObject("check", true);
			mv.addObject("delivery", ar);
			mv.addObject("length", ar.size());
			mv.addObject("num", num);
			
			
		}else {
			mv.addObject("check", false);
			
		}
		
		
		return mv;
		
	}
	
	@GetMapping("addDelivery")
	public void setDelivery() throws Exception{
		
		
		
	}
	@PostMapping("addDelivery")
	public String setDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		int result = memberService.setDelivey(deliveryDTO);
		
		return "redirect:./myPage";
	}
	
	@PostMapping("updateDelivery")
	public String updateDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		int result = memberService.updateDelivey(deliveryDTO);
		
		return "redirect:./myPage";
	}
	
}

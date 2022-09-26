package com.goodee.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.member.MemberDTO;



@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminSerivece adminSerivece;
	
	
	@GetMapping("main")
	public void getAdminMain() throws Exception{
		
		
		
		
	}
	
	@GetMapping("member")
	public ModelAndView getMember() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> ar = adminSerivece.getMember();
		
		mv.addObject("memberList",ar);
		return mv;
		
	}
	
	
}

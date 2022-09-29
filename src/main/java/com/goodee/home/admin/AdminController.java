package com.goodee.home.admin;

import java.util.List;import javax.naming.ldap.PagedResultsControl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.util.Pager;



@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminSerivece adminSerivece;
	
	
	@GetMapping("main")
	public void getAdminMain() throws Exception{
		
		
		
		
	}
	
	@GetMapping("member")
	public ModelAndView getMember(Pager pager) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		pager.setUrl("member");
		List<MemberDTO> ar = adminSerivece.getMember(pager);
		
		mv.addObject("memberList",ar);
		return mv;
		
	}
	
	
}

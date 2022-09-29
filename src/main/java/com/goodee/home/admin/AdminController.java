package com.goodee.home.admin;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;import javax.naming.ldap.PagedResultsControl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.member.RoleDTO;
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
		mv.addObject("pager",pager);
		mv.addObject("memberList",ar);
		return mv;
		
	}
	
	
	@GetMapping("updateRank")
	public String updateMemberRank(MemberDTO memberDTO,RoleDTO roleDTO,Pager page) throws Exception{
		
		List<RoleDTO> lr = new ArrayList<RoleDTO>();
		lr.add(roleDTO);
		memberDTO.setRoleDTOs(lr);
		
		if(roleDTO.getRoleNum()>=10 && roleDTO.getRoleNum()<=13) {
			adminSerivece.updateMemberRank(memberDTO);
		}else if(roleDTO.getRoleNum()==20) {
			
			int result = adminSerivece.addMemberRank(memberDTO);
			
		}
		
		
		
		
		String url = "";
		
		if(page.getPage() != null ) {
			url += "page=";
			url += page.getPage();
			url += "&";
			
		}
		
		
		if(page.getMemberFilter() != null) {
			for (String i : page.getMemberFilter()) {
				url += "memberFilter=";
				url += i;
				url += "&";
			}
		}
		
		
		
		return "redirect:./member?"+url;
	}
	
	
}

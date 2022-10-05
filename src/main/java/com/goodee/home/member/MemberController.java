package com.goodee.home.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.service.ServiceService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService = new MemberService();
	
	@Autowired
	ServiceService serviceService = new ServiceService();
	
	
	
	@GetMapping("login")
	public void getLogin() throws Exception{
	
		
	}
	
	@PostMapping("login")
	@ResponseBody
	public int getLogin(HttpSession session,MemberDTO memberDTO) throws Exception{
		
		memberDTO = memberService.getLogin(memberDTO);

		if (memberDTO != null) {
			session.setAttribute("member", memberDTO);
			for(RoleDTO role : memberDTO.getRoleDTOs()) {
				if(role.getRoleNum()<10) {
					session.setAttribute("ManagerRole", role);
				}else if(role.getRoleNum()<100 && role.getRoleNum()>9) {
					session.setAttribute("MemberRole", role);
				}	
			}
			session.setAttribute("profile", memberDTO.getMemberFileDTO());
			
			
			
			return 1;
		}else {
			
			return 0;
		}
		
		
		
	}
	
	
	@GetMapping("naverLogin")
	public ModelAndView getNaverLogin(HttpSession session,MemberDTO memberDTO) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
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
	public ModelAndView getMyPage(HttpSession session,String page) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	
		mv.addObject("memberDTO", memberDTO);
		mv.addObject("page",page);
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
	public String setUpdate(MemberDTO memberDTO,HttpSession session,MultipartFile profileImg) throws Exception{
		
		
		MemberDTO memberDTO2 =  (MemberDTO) session.getAttribute("member");
		
		
		memberDTO.setPassword(memberDTO2.getPassword());
		memberDTO.setMemberFileDTO(memberDTO2.getMemberFileDTO());
		MemberFileDTO memberFileDTO = new MemberFileDTO();
		if(memberDTO2.getMemberFileDTO()== null && !profileImg.isEmpty()) { // 세션이 없고 , 사진이 있다.
			
			 memberFileDTO = memberService.setInsert(memberDTO,session.getServletContext(),profileImg);
			 memberDTO.setMemberFileDTO(memberFileDTO);
			
	
		}else if (memberDTO2.getMemberFileDTO()!= null && !profileImg.isEmpty()) {	// 세션이 있고 , 사진이 있다.
			 
			 memberFileDTO = memberService.setUpdate(memberDTO,session.getServletContext(),profileImg);
			 memberDTO.setMemberFileDTO(memberFileDTO);
			
		}else if(memberDTO2.getMemberFileDTO()!= null && profileImg.isEmpty()){  // 세션 o 사진 x // 내용만 수정하는 경우
			
			memberService.setUpdate(memberDTO,session.getServletContext(),profileImg);
		
		}else {  // 세션 x 사진 x , 
			// 삭제를 누르면 사진이 사라진다
			
			
		}
		
		session.setAttribute("member",memberDTO);
		session.setAttribute("profile", memberDTO.getMemberFileDTO());
		
		
		
		return "redirect:./myPage";
	}
	
	
	@PostMapping("delete")
	public String setDeleteProfile(MemberDTO memberDTO,HttpSession session,MultipartFile profileImg) throws Exception{
		
		
		MemberDTO memberDTO2= (MemberDTO) session.getAttribute("member");
		
		memberService.setUpdate(memberDTO,session.getServletContext(),profileImg);
		
		if(memberDTO2.getMemberFileDTO() != null) {
			memberService.setDeleteProfile(memberDTO2,session.getServletContext());
			
		}
		session.setAttribute("member", memberDTO);
		session.setAttribute("profile", memberDTO.getMemberFileDTO());
		
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
	public ModelAndView getDelivery(HttpSession session,Integer num) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<DeliveryDTO> ar =memberService.getDelivery(memberDTO);
	
		if(num == null ) {
				num =0;
		}
		
		
		mv.addObject("delivery", ar);
		mv.addObject("length", ar.size());
		mv.addObject("num", num);
			
		return mv;
		
	}
	
	@GetMapping("addDelivery")
	public void setDelivery() throws Exception{
		
		
		
	}
	
	@PostMapping("addDelivery")
	public String setDelivery(DeliveryDTO deliveryDTO,HttpSession session) throws Exception{
		
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");
		deliveryDTO.setUserId(memberDTO.getUserId());
		int result = memberService.setDelivery(deliveryDTO);
		
		return "redirect:./delivery";
	}
	
	@PostMapping("updateDelivery")
	public String updateDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		int result = memberService.updateDelivery(deliveryDTO);
		
		return "redirect:./delivery";
	}
	
	@PostMapping("deleteDelivery")
	public String deleteDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		
		int result = memberService.deleteDelivery(deliveryDTO);
		return "redirect:./delivery";
	}
	
	@PostMapping("dropMember")
	public String dropMember(MemberDTO memberDTO) throws Exception{
		
		// member & rank delete
		//int result = memberService.dropMember(memberDTO);
		
		
		//System.out.println("result =" +result);
		
		
		return "redirect:/";
	}
	
	@GetMapping("findId")
	@ResponseBody
	public String findId(MemberDTO memberDTO) throws Exception{
		
		memberDTO = memberService.findId(memberDTO);
		
		
		
		return memberDTO.getUserId();
	}
	
	@GetMapping("findPw")
	@ResponseBody
	public String findPw(MemberDTO memberDTO) throws Exception{
		
		memberDTO = memberService.findPw(memberDTO);
		
		return memberDTO.getPassword();
	}
	
	
	
}

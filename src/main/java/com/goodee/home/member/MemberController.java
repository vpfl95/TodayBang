package com.goodee.home.member;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.home.service.QnaDTO;
import com.goodee.home.service.ServiceService;
import com.goodee.home.store.product.ProductDTO;
import com.goodee.home.store.product.ProductOptionDTO;
import com.goodee.home.store.product.ProductService;
import com.goodee.home.store.review.ProductReviewDTO;
import com.goodee.home.store.review.ProductReviewService;
import com.goodee.home.store.review.ReviewLikeDTO;
import com.goodee.home.util.Pager;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	MemberService memberService = new MemberService();
	
	@Autowired
	ServiceService serviceService = new ServiceService();
	
	@Autowired
	ProductReviewService productReviewService = new ProductReviewService();
	
	@Autowired
	ProductService productService;
	
	
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
			memberService.setUpdate(memberDTO,session.getServletContext(),profileImg);
			
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
		System.out.println(deliveryDTO.getUserId());
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
	
	
	@GetMapping("myShopping")
	public ModelAndView getMyShopping(HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	
		
		mv.setViewName("member/myShopping");
		
		
		return mv;
	}
	
	
	@GetMapping("cart")
	public ModelAndView getCart(HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	
		List<CartDTO> ar =memberService.getCart(memberDTO);
		
		mv.addObject("length",ar.size());
		mv.addObject("cart",ar);
		mv.setViewName("member/cart");
		return mv;
	}
	
	@GetMapping(value = {"deliveryDetail","buyDetail"})
	public ModelAndView getDeliveryDetail(HttpSession session,HttpServletRequest request) throws Exception{
		
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	
		
		
		List<OrderDTO> ar =memberService.getOrder(memberDTO);
		
		
		String [] url = request.getServletPath().split("/");
		String page;
		if(url[2].equals("deliveryDetail") ) {
			page ="배송내역";
			
		}else {
			
			page ="구매내역";
		
		}
		
		mv.addObject("url",page);
		mv.addObject("length",ar.size());
		mv.addObject("order",ar);
		
		mv.setViewName("member/deliveryDetail");
		return mv;
	}
	

	
	
	
	@GetMapping("myWriting")
	public ModelAndView getMyWriting(HttpSession session) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	
		
		mv.setViewName("member/myWriting");
		
		
		return mv;
	}
	
	@GetMapping("myQna")
	public ModelAndView getMyQna(HttpSession session,Pager pager) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		pager.setUserId(memberDTO.getUserId());
		List<QnaDTO> ar = memberService.getMyQna(pager);
		
		
		
		mv.addObject("list",ar);
		mv.setViewName("member/myQna");
		return mv;
	}
	@GetMapping("myPdReview")
	public ModelAndView getMyPdReview(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");
		
		List<ProductReviewDTO> ar = memberService.getMyPdReview(memberDTO);
		
		
		
		
		mv.addObject("list", ar);
		return mv;
		
	}
	@GetMapping("myRoomReview")
	public void getMyRoomReview() throws Exception{
		
		
		
	}
	
	
	@GetMapping("deleteCart")
	public String deleteCart(CartDTO cartDTO) throws Exception{
		
		
		int result = memberService.deleteCart(cartDTO);
		
		return "redirect:/member/myShopping";
	}
	@GetMapping("deleteSelectCart")
	public String deleteSelectCart(Long [] cartNum) throws Exception{
		
		
		for(Long i : cartNum) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setCartNum(i);
			memberService.deleteCart(cartDTO);
			
		}
		
		
		return "redirect:/member/myShopping";
	}
	
	
	@PostMapping("checkout")
	public String getPage(Model model, String[] optionName, String[] optionPrice, String[] optionCount, String totalPrice, ProductDTO productDTO) throws Exception {
		
		productDTO = productService.getOrderProduct(productDTO);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("detail", productDTO);
		return "store/order/order";
	}
}

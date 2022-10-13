package com.goodee.home.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodee.home.service.QnaDTO;
import com.goodee.home.service.ServiceService;
import com.goodee.home.store.product.ProductDTO;
import com.goodee.home.store.product.ProductOptionDTO;
import com.goodee.home.store.product.ProductService;
import com.goodee.home.store.review.ProductReviewDTO;
import com.goodee.home.store.review.ProductReviewService;
import com.goodee.home.store.review.ReviewLikeDTO;
import com.goodee.home.util.Pager;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

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
	
	private IamportClient api;
	
	public MemberController() {
		this.api = new IamportClient("2247786281124377", "9XwjixWfWPGglCVexIchgmZvYnRzcZnwZCV3zCNI1G2wN1ckilmckK5OhvOx6ly3nAUlkpoaoNIGzMQk");
	}
	
	
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
	public String updateDelivery(DeliveryDTO deliveryDTO,HttpSession session) throws Exception{
		MemberDTO memberDTO=(MemberDTO) session.getAttribute("member");
		deliveryDTO.setUserId(memberDTO.getUserId());
		int result = memberService.updateDelivery(deliveryDTO);
		
		return "redirect:./delivery";
	}
	
	@PostMapping("deleteDelivery")
	public String deleteDelivery(DeliveryDTO deliveryDTO) throws Exception{
		// order 에서 사용하는 지 검사
		
		
		
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
		
		
		
		StringBuffer buf =new StringBuffer();
		memberDTO = memberService.findPw(memberDTO);
		if(memberDTO.getUserId() != null) {
			
			Random rnd =new Random();
			
			for(int i=0;i<10;i++){
				if(rnd.nextBoolean()){
					buf.append((char)((int)(rnd.nextInt(26))+97));
					}
				else{
					 buf.append((rnd.nextInt(10)));
				}
				
			}
			System.out.println(buf);
			System.out.println(buf);
			System.out.println(buf);
			System.out.println(buf);
			//memberDTO.setPassword(buf.toString());
			//memberService.setUpdatePw(memberDTO);
		}
		
		String pass = buf.toString();
		
		
		
		return pass;
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
	public String getPage(Model model, Long[] optionNum, Long[] optionCount, String totalPrice, ProductDTO productDTO, String result, HttpSession session) throws Exception {
		int count=0; int price=0; long productCount=0L;
		List<ProductOptionDTO> ar = new ArrayList<ProductOptionDTO>();
		if(optionNum != null) {
			for(count=0; count<optionNum.length; count++) {
				ProductOptionDTO productOptionDTO = new ProductOptionDTO();
				productOptionDTO.setOptionNum(optionNum[count]);
				productOptionDTO = productService.getOption(productOptionDTO);
				productOptionDTO.setOptionCount(optionCount[count]);
				ar.add(productOptionDTO);
			}
		}
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		Long mileage = memberService.getMileage(memberDTO);
		List<DeliveryDTO> deliveryDTOs = memberService.getDelivery(memberDTO);
		productDTO = productService.getOrderProduct(productDTO);
		if(result.equals("0")) {
			price = (int) (productDTO.getPrice() * (100 - productDTO.getSaleRate())/100);
			productCount = optionCount[count];
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String deliveryJson = mapper.writeValueAsString(deliveryDTOs);
		
		model.addAttribute("list", ar);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("detail", productDTO);
		model.addAttribute("result", result);
		model.addAttribute("price", price);
		model.addAttribute("mileage", mileage);		
		model.addAttribute("productCount", productCount);
		model.addAttribute("deliveryDTOs", deliveryDTOs);
		model.addAttribute("deliveryJson", deliveryJson);
		return "store/order/order";
	}
	
	@PostMapping("orderComplete")
	@ResponseBody
	public IamportResponse<Payment> orderComplete(String imp_uid) throws Exception {
		return api.paymentByImpUid(imp_uid);
	}
	
	@PostMapping("addOrder")
	@ResponseBody
	public int addOrder(String imp_uid, Long delivery, Long result, Long productCount, Long[] optionNum, Long[] optionCount, Long productNum, Long point, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO.setMileage(point);
		memberService.updateMileage(memberDTO);
		OrderDTO orderDTO = new OrderDTO();
		if(delivery == 0L) {
			IamportResponse<Payment> response = api.paymentByImpUid(imp_uid);
			DeliveryDTO deliveryDTO = new DeliveryDTO();
			deliveryDTO.setName(response.getResponse().getBuyerName());
			deliveryDTO.setPhone(response.getResponse().getBuyerTel());
			deliveryDTO.setNote("");
			deliveryDTO.setDeliveryName("");
			deliveryDTO.setUserId("");
			deliveryDTO.setAddress(response.getResponse().getBuyerAddr());
			deliveryDTO.setPostcode(Integer.parseInt(response.getResponse().getBuyerPostcode()));
			deliveryDTO.setDetailAddress("");
			deliveryDTO.setExtraAddress("");
			memberService.setDelivery(deliveryDTO);
			orderDTO.setAddressNum(deliveryDTO.getAddressNum());
		} else {
			orderDTO.setAddressNum(delivery);
		}
		orderDTO.setUserId(memberDTO.getUserId());
		orderDTO.setPayment("card");
		orderDTO.setProductNum(productNum);
		if(result == 0) {
			// buyAmount, productNum 세팅
			orderDTO.setBuyAmount(productCount);
		} else { // 필수 옵션 찾아서 count 넣기
			orderDTO.setBuyAmount(0L);
		}
		orderDTO.setDeliveryStatus("결제 완료");
		Long orderNum = memberService.getOrderNum();
		orderDTO.setOrderNum(orderNum);
		int result1 = memberService.setOrder(orderDTO);
		for(int i=0; i<optionCount.length; i++) {
			Order_OptionDTO order_OptionDTO = new Order_OptionDTO();
			order_OptionDTO.setOptionNum(optionNum[i]);
			order_OptionDTO.setOptionCount(optionCount[i]);
			order_OptionDTO.setOrderNum(orderDTO.getOrderNum());
			memberService.setOrderOption(order_OptionDTO);
		}
		
		return result1;
	}
	
	@PostMapping("addCart")
	public String addCart(Long result, Long[] optionNum, Long[] optionCount, Long productNum, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserId(memberDTO.getUserId());
		cartDTO.setProductNum(productNum);
		if(result == 0) {
			// buyAmount, productNum 세팅
			cartDTO.setBuyAmount(optionCount[optionCount.length-1]);
		} else { // 필수 옵션 찾아서 count 넣기
			cartDTO.setBuyAmount(0L);
		}
		memberService.addCart(cartDTO);
		if(optionNum != null) {
			for(int i=0; i<optionNum.length; i++) {
				Cart_OptionDTO cart_OptionDTO = new Cart_OptionDTO();
				cart_OptionDTO.setOptionNum(optionNum[i]);
				cart_OptionDTO.setOptionCount(optionCount[i]);
				cart_OptionDTO.setCartNum(cartDTO.getCartNum());
				memberService.setCartOption(cart_OptionDTO);
			}
		}
		return "redirect:/product/detail?productNum="+productNum;
	}
}

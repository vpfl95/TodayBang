package com.goodee.home.interceptor;

import java.io.Console;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.review.HouseReviewDTO;

public class WriterCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		boolean check = true;
		
		HttpSession session = request.getSession();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		Map<String, Object> map = modelAndView.getModel();

		HouseReviewDTO houseReviewDTO =(HouseReviewDTO)map.get("houseReviewDTO");
		System.out.println("포스트인터셉터 로그인"+memberDTO.getUserId());
		System.out.println("포스트인터셉터 작성자"+houseReviewDTO.getUserId());
		
		
		if(!memberDTO.getUserId().equals(houseReviewDTO.getUserId())) {
			System.out.println("일치하지 않음");
			modelAndView.setViewName("common/ajaxResult");
			modelAndView.addObject("result",0);
		}else {
			modelAndView.setViewName("common/ajaxResult");
			modelAndView.addObject("result",1);
		
		}
		
	}

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		// TODO Auto-generated method stub
//		System.out.println("프리인터셉터");
//		return true;
//	}


	

}

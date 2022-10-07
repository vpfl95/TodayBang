package com.goodee.home.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.goodee.home.member.MemberDTO;

public class WriterCheckInterceptor extends HandlerInterceptorAdapter {

//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		HttpSession session = request.getSession();
//		
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//		
//		Map<String, Object> map = modelAndView.getModel();
//		System.out.println("인터셉터");
//		System.out.println(map);
//		super.postHandle(request, response, handler, modelAndView);
//	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("프리인터셉터");
		return super.preHandle(request, response, handler);
	}


	

}

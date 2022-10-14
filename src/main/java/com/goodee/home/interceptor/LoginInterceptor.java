package com.goodee.home.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.member.RoleDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		System.out.println("인터셉터");
		if(obj != null ) {
			
			return true ;
		}else {
			
			response.sendRedirect("../../../../../../../member/login");
			return false;	
		}
	}	
	
	
		
	
	
}

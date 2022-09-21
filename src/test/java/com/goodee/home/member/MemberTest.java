package com.goodee.home.member;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goodee.home.MyAbstractTest;

public class MemberTest extends MyAbstractTest{

	@Autowired
	MemberDAO memberDAO = new MemberDAO();
	
	//@Test
	public void getLoginTest() throws Exception{
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId("ID1");
		memberDTO.setPassword("PW1");
		
		
		memberDTO = memberDAO.getLogin(memberDTO);
		
		assertNotNull(memberDTO);
		
	}
	//@Test
	public void getJoinTest() throws Exception{
			
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId("ID2");
		memberDTO.setPassword("PW2");
		memberDTO.setNickname("nick2");
		memberDTO.setEmail("email2");
		memberDTO.setPhone("phone2");
		memberDTO.setUserName("name2");
		
		
		int result = memberDAO.getJoin(memberDTO);
		
		assertEquals(1, result);
		
	}
	//@Test
	public void JoinOverlabTest() throws Exception{
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId("ID2");
		
		
	
		
		
		
		MemberDTO result = memberDAO.getJoinOverlab(memberDTO);
		System.out.println("result  ===" + result);
		assertNotNull(result);
		
	}
	
	
	//@Test
		public void setUpdate() throws Exception{
				
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setUserId("4444");
			
			memberDTO.setNickname("nick44");
			memberDTO.setEmail("email44");
			memberDTO.setPhone("phone44");
			memberDTO.setUserName("name44");
			
			
			int result = memberDAO.setUpdate(memberDTO);
			
			assertEquals(1, result);
			
		}
		
		//@Test
		public void getRoleTest() throws Exception{
			
		}
		

}

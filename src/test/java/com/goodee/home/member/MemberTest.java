package com.goodee.home.member;

import static org.junit.Assert.*;

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
	
	

}

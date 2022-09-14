package com.goodee.home.member;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goodee.home.MyAbstractTest;

public class MemberTest extends MyAbstractTest{

	@Autowired
	MemberDAO memberDAO = new MemberDAO();
	
	@Test
	public void getLoginTest() throws Exception{
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId("ID1");
		memberDTO.setPassword("PW1");
		
		
		memberDTO = memberDAO.getLogin(memberDTO);
		
		assertNotNull(memberDTO);
		
	}
	

}

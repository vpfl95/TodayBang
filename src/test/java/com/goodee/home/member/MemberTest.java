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
		memberDTO.setUserId("111");
		memberDTO.setPassword("111");
		
		
		memberDTO = memberDAO.getLogin(memberDTO);
		
		assertNotNull(memberDTO);
		
	}
	//@Test
	public void getJoinTest() throws Exception{
		
		
		for(int i=0; i<10;i++) {
			
			MemberDTO memberDTO = new MemberDTO();
			
			
			memberDTO.setUserId("ID2" +i);
			memberDTO.setPassword("PW2");
			memberDTO.setNickname("nick2" +i);
			memberDTO.setEmail("email2" +i +"@naver.com");
			memberDTO.setPhone("010-" +i+"12-"+i+"43" );
			memberDTO.setUserName("name2" +i);
			
			int result = memberDAO.getJoin(memberDTO);
			memberDAO.setJoinRole(memberDTO);
		}
		
		
		
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
		
		//@Test
		public void getDeliveryTest() throws Exception{
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setUserId("qqqqw");
			
			
			
			List<DeliveryDTO> result = memberDAO.getDelivery(memberDTO);
			
			assertNotNull(result);
			
		}
		
		//@Test
		public void setDeliveryTest() throws Exception{
			
			DeliveryDTO dto = new DeliveryDTO();
			dto.setUserId("qqqqw");
			dto.setAddress("addt");
			dto.setDeliveryName("delnamet");
			dto.setName("namet");
			dto.setNote("note");
			dto.setPhone("phonet");
			
			
			int result = memberDAO.setDelivery(dto);
			
			assertEquals(result,1);
			
		}
		
		//@Test
		public void dropMemberTest() throws Exception{
			
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setUserId("ID1");
			
			int result = memberDAO.dropMember(memberDTO);
			
			System.out.println(result);
			assertEquals(result,1);
		}
		
		

}

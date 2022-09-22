package com.goodee.home.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO = new MemberDAO();
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.getLogin(memberDTO);
	}
	
	
	public int getJoin(MemberDTO memberDTO) throws Exception{
		
		int result = memberDAO.getJoin(memberDTO);
		memberDAO.setJoinRole(memberDTO);
		
		return result;
	}
	
	
	public MemberDTO getJoinOverlab(MemberDTO memberDTO) throws Exception{
		
		
		
		return memberDAO.getJoinOverlab(memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.setUpdate(memberDTO);
	}
	
	public int setUpdatePw(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.setUpdatePw(memberDTO);
	}
	
	public List<DeliveryDTO> getDelivey(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.getDelivery(memberDTO);
	}
	
	public int setDelivey(DeliveryDTO deliveryDTO) throws Exception{
		
		return memberDAO.setDelivery(deliveryDTO);
	}
	
	
}

package com.goodee.home.member;

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
		
		return memberDAO.getJoin(memberDTO);
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
}

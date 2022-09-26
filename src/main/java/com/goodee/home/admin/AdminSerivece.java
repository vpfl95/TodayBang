package com.goodee.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.member.MemberDTO;

@Service
public class AdminSerivece {

	@Autowired
	private AdminDAO adminDAO;
	
	
	public List<MemberDTO> getMember() throws Exception{
		
		
		
		return adminDAO.getMember();
	}
	
}

package com.goodee.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.util.Pager;

@Service
public class AdminSerivece {

	@Autowired
	private AdminDAO adminDAO;
	
	
	public Long getMemberCount() throws Exception{
		
		return adminDAO.getMemberCount();
	}
	
	
	
	public List<MemberDTO> getMember(Pager pager) throws Exception{
		
		pager.getNum(getMemberCount());
		pager.getRowNum();
		
		
		return adminDAO.getMember(pager);
	}
	
	
	public int updateMemberRank(MemberDTO memberDTO) throws Exception{
		
		
		return adminDAO.updateMemberRank(memberDTO);
	}
	
	
	public int addMemberRank(MemberDTO memberDTO) throws Exception{
		
		
		return adminDAO.addMemberRank(memberDTO);
	}
	
}

package com.goodee.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.member.RoleDTO;
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
	
	
	public int updateMemberRank(MemberDTO memberDTO,String action) throws Exception{
		
		memberDTO = adminDAO.getDetailMember(memberDTO);
		Long newRoleNum = null ;
		
		
		
		if(action.equals("ban")) {
			newRoleNum = 20L;
			memberDTO.setNewRoleNum(newRoleNum);
			adminDAO.addMemberRank(memberDTO);
			
		}else if (action.equals("noBan")) {
			
			//adminDAO.deleteMemberRank();
		}
		
		
		
		
		if(action.equals("up")||action.equals("down")) {
			for(RoleDTO role : memberDTO.getRoleDTOs()) {
				if(role.getRoleNum()>9 && role.getRoleNum()<20) {
				memberDTO.setRoleDTO(role);
				if(action.equals("up")) {
					newRoleNum = role.getRoleNum() - 1;
					memberDTO.setNewRoleNum(newRoleNum);
				}else if(action.equals("down")) {
					newRoleNum = role.getRoleNum() + 1;
					memberDTO.setNewRoleNum(newRoleNum);
				}
				
				if(newRoleNum >9 && newRoleNum<14) {
					adminDAO.updateMemberRank(memberDTO);
				}
				
				break;
				}
			}
		}	
				
		
		return 0;
	}
	
	
	public int addMemberRank(MemberDTO memberDTO) throws Exception{
		
		
		return adminDAO.addMemberRank(memberDTO);
	}
	
}

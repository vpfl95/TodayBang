package com.goodee.home.member;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.home.util.FileManger;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO = new MemberDAO();
	
	@Autowired
	FileManger fileManger = new FileManger();
	
	
	
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
	
	public int setUpdate(MemberDTO memberDTO,ServletContext servletContext,MultipartFile profileImg) throws Exception{
		
		int result = memberDAO.setUpdate(memberDTO);
		
		
		String path = "resources/upload/member";
		
		if(!profileImg.isEmpty()) {
			
			String fileName = fileManger.saveFile(path, servletContext, profileImg);
			MemberFileDTO memberFileDTO = new MemberFileDTO();
			memberFileDTO.setFileName(fileName);
			memberFileDTO.setOriName(profileImg.getOriginalFilename());
			memberFileDTO.setUserId(memberDTO.getUserId());
			
			
			
			memberDAO.setProfileImg(memberFileDTO);
			
		
		}
		
		
		
		return result;
	}
	
	public int setUpdatePw(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.setUpdatePw(memberDTO);
	}
	
	public List<DeliveryDTO> getDelivery(MemberDTO memberDTO) throws Exception{
		
		return memberDAO.getDelivery(memberDTO);
	}
	
	public int setDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		return memberDAO.setDelivery(deliveryDTO);
	}
	
	public int updateDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		return memberDAO.updateDelivery(deliveryDTO);
	}
	
	public int deleteDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		return memberDAO.deleteDelivery(deliveryDTO);
	}
}

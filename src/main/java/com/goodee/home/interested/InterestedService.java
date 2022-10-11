package com.goodee.home.interested;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InterestedService {

	@Autowired
	private InterestedDAO interestedDAO;
	
	public int setInterested(InterestedDTO interestedDTO)throws Exception{
		return interestedDAO.setInterested(interestedDTO);
	}
	
	public List<InterestedDTO> getInterestedUser(InterestedDTO interestedDTO)throws Exception{
		return interestedDAO.getInterestedUser(interestedDTO);
	}
	
	public int setDeleteInterested(InterestedDTO interestedDTO)throws Exception{
		return interestedDAO.setDeleteInterested(interestedDTO);
	}
}

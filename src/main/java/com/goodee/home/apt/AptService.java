package com.goodee.home.apt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.realEstate.RealEstateDAO;
import com.goodee.home.realEstate.RealEstateDTO;


@Service
public class AptService {
	@Autowired
	private AptDAO aptDAO;
	
	public List<RealEstateDTO> getAptRoadName(AptDTO aptDTO) throws Exception{
		return aptDAO.getAptRoadName(aptDTO); 
	}
	
	public List<AptDTO> getList(AptDTO aptDTO)throws Exception{
		return aptDAO.getList(aptDTO);
	}
	
}

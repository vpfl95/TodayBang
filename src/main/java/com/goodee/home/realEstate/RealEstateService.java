package com.goodee.home.realEstate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RealEstateService {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public List<RealEstateDTO> getAptRoadName() throws Exception{
		return realEstateDAO.getAptRoadName(); 
	}
}

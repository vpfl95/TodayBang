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
	
	public int setAddMM(RealEstateDTO realEstateDTO)throws Exception{
		return realEstateDAO.setAddMM(realEstateDTO);
	}
	
	public int setAddJS(RealEstateDTO realEstateDTO)throws Exception{
		return realEstateDAO.setAddJS(realEstateDTO);
	}
	
	public int setAddWS(RealEstateDTO realEstateDTO)throws Exception{
		return realEstateDAO.setAddWS(realEstateDTO);
	}
	
	public List<RealEstateDTO> getHaddress(String search)throws Exception{
		return realEstateDAO.getHaddress(search);
	}
}

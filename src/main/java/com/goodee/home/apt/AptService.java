package com.goodee.home.apt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.realEstate.RealEstateDAO;
import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.util.MaemulPager;


@Service
public class AptService {
	@Autowired
	private AptDAO aptDAO;
	
	public List<RealEstateDTO> getAptRoadName(AptDTO aptDTO) throws Exception{
		return aptDAO.getAptRoadName(aptDTO); 
	}
	
	public List<AptDTO> getList(MaemulPager maemulPager)throws Exception{
		maemulPager.getRowNum();

		Long totalCount = aptDAO.getTotalCount(maemulPager);
		
		maemulPager.makePage(totalCount);
		
		return aptDAO.getList(maemulPager);
	}
	
}

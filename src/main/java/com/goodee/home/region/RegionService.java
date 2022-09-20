package com.goodee.home.region;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegionService {
	
	@Autowired
	private RegionDAO regionDAO;
	
	public List<RegionDTO> getSido(RegionDTO regionDTO)throws Exception{
		return regionDAO.getSido(regionDTO);
	}
	
	public List<RegionDTO> getSigungu(RegionDTO regionDTO)throws Exception{	
		return regionDAO.getSigungu(regionDTO);
	}
	
	public List<RegionDTO> getEmd(RegionDTO regionDTO)throws Exception{
		return regionDAO.getEmd(regionDTO);
	}
}

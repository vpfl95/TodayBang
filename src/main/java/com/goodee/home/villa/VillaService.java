package com.goodee.home.villa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.apt.AptDTO;
import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.util.MaemulPager;

@Service
public class VillaService {

	@Autowired
	private VillaDAO villaDAO;
	
	public List<RealEstateDTO> getVillaRoadName(VillaDTO villaDTO)throws Exception{
		return villaDAO.getVillaRoadName(villaDTO);
	}
	
	public List<VillaDTO> getList(MaemulPager maemulPager)throws Exception{
		maemulPager.getRowNum();

		Long totalCount = villaDAO.getTotalCount(maemulPager);
		
		maemulPager.makePage(totalCount);
		
		return villaDAO.getList(maemulPager);
	}
	
	public List<VillaDTO> getSearchAddressList(String search)throws Exception{
		return villaDAO.getSearchAddressList(search);
	}
	
	public List<VillaDTO> getSearchVillaList(String search)throws Exception{
		return villaDAO.getSearchVillaList(search);
	}
}

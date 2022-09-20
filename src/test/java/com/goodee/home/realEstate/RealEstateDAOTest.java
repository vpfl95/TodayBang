package com.goodee.home.realEstate;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goodee.home.MyAbstractTest;
import com.goodee.home.region.RegionDAO;
import com.goodee.home.region.RegionDTO;

public class RealEstateDAOTest extends MyAbstractTest {

	@Autowired
	public RegionDAO sigunguDAO;
	
	@Test
	public void getHouseList()throws Exception {
		RegionDTO sigunguDTO = new RegionDTO();
		sigunguDTO.setSwLat(37.52419292151873);
		sigunguDTO.setSwLon(126.62872071978974);
		sigunguDTO.setNeLat(37.553158040083126);
		sigunguDTO.setNeLon(126.67384481418183);
		
		List<RegionDTO> arr = sigunguDAO.getSigungu(sigunguDTO);
		System.out.println(arr.size());
		assertNotEquals(0, arr.size());
		
	}

}

package com.goodee.home.realEstate;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.goodee.home.MyAbstractTest;
import com.goodee.home.apt.AptDAO;
import com.goodee.home.apt.AptDTO;
import com.goodee.home.region.RegionDAO;
import com.goodee.home.region.RegionDTO;
import com.goodee.home.util.MaemulPager;

public class RealEstateDAOTest extends MyAbstractTest {

	@Autowired
	public RegionDAO sigunguDAO;
	@Autowired
	public AptDAO aptDAO;
	
//	@Test
//	public void getHouseList()throws Exception {
//		RegionDTO sigunguDTO = new RegionDTO();
//		sigunguDTO.setSwLat(37.52419292151873);
//		sigunguDTO.setSwLon(126.62872071978974);
//		sigunguDTO.setNeLat(37.553158040083126);
//		sigunguDTO.setNeLon(126.67384481418183);
//		
//		List<RegionDTO> arr = sigunguDAO.getSigungu(sigunguDTO);
//		System.out.println(arr.size());
//		assertNotEquals(0, arr.size());
//		
//	}
	
//	@Test
//	public void getList() throws Exception{
//		AptDTO aptDTO = new AptDTO();
//		aptDTO.setRoadName("남부순환로 1266");
//		
//		List<AptDTO> arr = (List<AptDTO>)aptDAO.getList(aptDTO);
//		
//		assertEquals(2, arr.size());
//		
//	}
	
	@Test
	public void getCount() throws Exception{
		MaemulPager maemulPager = new MaemulPager();
		maemulPager.setRoadName("남부순환로 1266");
		
		long result = aptDAO.getCount(maemulPager);
		
		assertEquals(2L, result);
		
	}

}

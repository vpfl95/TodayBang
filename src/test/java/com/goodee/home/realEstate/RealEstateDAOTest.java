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
import com.goodee.home.review.HouseReviewDAO;
import com.goodee.home.review.HouseReviewDTO;
import com.goodee.home.util.MaemulPager;


public class RealEstateDAOTest extends MyAbstractTest {

	@Autowired
	public RegionDAO sigunguDAO;
	@Autowired
	public AptDAO aptDAO;
	@Autowired
	private HouseReviewDAO houseReviewDAO;
	
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
//		MaemulPager maemulPager = new MaemulPager();
//		maemulPager.getRowNum();
//		maemulPager.setRoadName("남부순환로 1266");
//
//		long totalCount = aptDAO.getTotalCount(maemulPager);
//		maemulPager.makePage(totalCount);
//		
//		List<AptDTO> arr = (List<AptDTO>)aptDAO.getList(maemulPager);
//		
//		assertEquals(2,arr.size());
//		
//	}
	
//	@Test
//	public void getSearchList() throws Exception{
//		
//		List<AptDTO> arr = (List<AptDTO>)aptDAO.getSearchList("은마");
//		
//		assertEquals(9,arr.size());
//		
//	}
	
//	@Test
//	public void getHouseReview() throws Exception{
//		
//		AptDTO aptDTO = new AptDTO();
//		aptDTO.setRoadName("청라라임로 131");
//		
//		List<HouseReviewDTO> arr = (List<HouseReviewDTO>)houseReviewDAO.getHouseReview(aptDTO);
//		
//		assertEquals(1,arr.size());
//		
//	}
	@Test
	public void getHouseReview() throws Exception{
		
		MaemulPager maemulPager = new MaemulPager();
		maemulPager.getRowNum();
		maemulPager.setRoadName("가산디지털1로 222");

		long totalCount = houseReviewDAO.getTotalCount(maemulPager);
		maemulPager.makePage(totalCount);
		System.out.println(totalCount);
		List<HouseReviewDTO> arr = (List<HouseReviewDTO>)houseReviewDAO.getHouseReview(maemulPager);
		
		assertEquals(2,arr.size());
		
	}
	
}

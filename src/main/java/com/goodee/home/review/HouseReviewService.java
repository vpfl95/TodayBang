package com.goodee.home.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.util.MaemulPager;

@Service
public class HouseReviewService {
	
	@Autowired
	private HouseReviewDAO houseReviewDAO;
	
	public List<HouseReviewDTO> getHouseReview(MaemulPager maemulPager)throws Exception{
		
		maemulPager.getRowNum();
		Long totalCount = houseReviewDAO.getTotalCount(maemulPager);
		maemulPager.makePage(totalCount);
		
		return houseReviewDAO.getHouseReview(maemulPager);
	}
	
	public int setAddHouseReview(HouseReviewDTO houseReviewDTO)throws Exception{
		return houseReviewDAO.setAddHouseReview(houseReviewDTO);
	}
	
	public int setUpdateReview(HouseReviewDTO houseReviewDTO)throws Exception{
		return houseReviewDAO.setUpdateReview(houseReviewDTO);
	}
	
	public int setDeleteReview(HouseReviewDTO houseReviewDTO)throws Exception{
		return houseReviewDAO.setDeleteReview(houseReviewDTO);
	}
}

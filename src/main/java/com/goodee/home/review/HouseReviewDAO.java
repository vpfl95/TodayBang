package com.goodee.home.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.home.apt.AptDTO;
import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.util.MaemulPager;

@Repository
public class HouseReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.review.HouseReviewDAO.";
	
	public List<HouseReviewDTO> getHouseReview(MaemulPager maemulPager)throws Exception{
		return	sqlSession.selectList(NAMESPACE+"getHouseReview", maemulPager); 
	}
	
	public Long getTotalCount(MaemulPager maemulPager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",maemulPager);
	}
	
	public int setAddHouseReview(HouseReviewDTO houseReviewDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddHouseReview", houseReviewDTO);
	}
	
	public int setUpdateReview(HouseReviewDTO houseReviewDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setUpdateReview", houseReviewDTO);
	}
	
	public int setDeleteReview(HouseReviewDTO houseReviewDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteReview", houseReviewDTO);
	}
}

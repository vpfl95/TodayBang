package com.goodee.home.store.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductReviewDAO {
	
	private final String NAMESPACE="com.goodee.home.store.review.ProductReviewDAO.";
	@Autowired
	private SqlSession sqlSession;
	
	public int addReview(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addReview", productReviewDTO);
	}
	
	public List<ProductReviewDTO> getReview(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getReview", productReviewDTO);
	}
	
	public List<Long> getGrade(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getGrade", productReviewDTO);
	}
}

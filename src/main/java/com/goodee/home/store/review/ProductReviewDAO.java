package com.goodee.home.store.review;

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
}

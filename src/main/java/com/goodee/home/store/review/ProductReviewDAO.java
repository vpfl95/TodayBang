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
	
	public List<ProductReviewDTO> getReviewBest(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getReviewBest", productReviewDTO);
	}
	
	public List<ProductReviewDTO> getReviewNew(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getReviewNew", productReviewDTO);
	}
	
	public List<Long> getGrade(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getGrade", productReviewDTO);
	}
	
	public ReviewLikeDTO getHelp(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getHelp", reviewLikeDTO);
	}
	
	public int setHelp(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setHelp", reviewLikeDTO);
	}
	
	public int deleteHelp(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteHelp", reviewLikeDTO);
	}
	
	public Long getHelpCount(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getHelpCount", reviewLikeDTO);
	}
	
	public ProductReviewDTO getReviewDetail(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getReviewDetail", productReviewDTO);
	}
	
	public int deleteReview(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteReview", productReviewDTO);
	}
	
	public int deleteHelpAll(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteHelpAll", productReviewDTO);
	}
	
	public int updateReview(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"updateReview", productReviewDTO);
	}
}

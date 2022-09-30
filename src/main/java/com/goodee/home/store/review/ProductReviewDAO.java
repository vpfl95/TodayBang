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
	
	public HelpDTO getHelp(HelpDTO helpDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getHelp", helpDTO);
	}
	
	public int setHelp(HelpDTO helpDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setHelp", helpDTO);
	}
	
	public int deleteHelp(HelpDTO helpDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteHelp", helpDTO);
	}
	
	public Long getHelpCount(HelpDTO helpDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getHelpCount", helpDTO);
	}
	
	public ProductReviewDTO getReviewDetail(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getReviewDetail", productReviewDTO);
	}
	
	public int deleteReview(ProductReviewDTO productReviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteReview", productReviewDTO);
	}
}

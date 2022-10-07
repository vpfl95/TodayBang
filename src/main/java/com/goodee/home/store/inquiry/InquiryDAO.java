package com.goodee.home.store.inquiry;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.store.inquiry.InquiryDAO.";
	
	
	public int addInquiry(InquiryDTO inquiryDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"addInquiry", inquiryDTO);
	}
	
	public List<InquiryDTO> getInauiryList(InquiryDTO inquiryDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getInauiryList", inquiryDTO);
	}
	
	public int deleteInquiry(InquiryDTO inquiryDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteInquiry", inquiryDTO);
	}
	
	public int replyInquiry(InquiryDTO inquiryDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"replyInquiry", inquiryDTO);
	}
	
	public InquiryDTO getReply(InquiryDTO inquiryDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getReply", inquiryDTO);
	}
}
package com.goodee.home.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceDAO {

	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.goodee.home.service.ServiceDAO.";
	
	
	public List<NoticeDTO> getNotice() throws Exception{
		
		
		
		return sqlSession.selectList(NAMESPACE + "getNotice");
	}
	
	
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO) throws Exception{
		
		
		
		return sqlSession.selectOne(NAMESPACE + "getNoticeDetail",noticeDTO);
	}
	
	
}

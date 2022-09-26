package com.goodee.home.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.home.util.Pager;

@Repository
public class ServiceDAO {

	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.goodee.home.service.ServiceDAO.";
	
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		
		
		
		return sqlSession.selectList(NAMESPACE + "getList",pager);
	}
	
	
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception{
		
		
		
		return sqlSession.selectOne(NAMESPACE + "getDetail",boardDTO);
	}
	
	
	public Long getCount() throws Exception{
		
		
		return sqlSession.selectOne(NAMESPACE+"getCount");
	}
	
}

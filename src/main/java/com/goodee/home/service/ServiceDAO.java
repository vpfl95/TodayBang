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
	
	
	public List<BoardDTO> getList(String board) throws Exception{
		
		
		
		return sqlSession.selectList(NAMESPACE + "getList",board);
	}
	
	
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception{
		
		
		
		return sqlSession.selectOne(NAMESPACE + "getDetail",boardDTO);
	}
	
	
}

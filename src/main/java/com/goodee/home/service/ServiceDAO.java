package com.goodee.home.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	
	public Long getCount(Pager pager) throws Exception{
		
		
		return sqlSession.selectOne(NAMESPACE+"getCount",pager);
	}
	
	public int addBoard(BoardDTO boardDTO) throws Exception{
		
		
		return sqlSession.insert(NAMESPACE+"addBoard",boardDTO);
	}
	
	public int deleteBoard(BoardDTO boardDTO) throws Exception{
		
		
		return sqlSession.delete(NAMESPACE+"deleteBoard",boardDTO);
	}
	
	
	
	public int addQnaAnswer(BoardDTO boardDTO) throws Exception{
		
		
		
		return sqlSession.insert(NAMESPACE+"addQnaAnswer",boardDTO);
	}
	
	
	public int updateBoard(BoardDTO boardDTO) throws Exception{
		
		System.out.println("update" + boardDTO.getBoard());
		return sqlSession.update(NAMESPACE+"updateBoard",boardDTO);
	}
	
	
	public int deleteAnswer(BoardDTO boardDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE+"deleteAnswer",boardDTO);
	}
	
	public int updateAnswer(BoardDTO boardDTO) throws Exception{
		
		return sqlSession.update(NAMESPACE+"updateAnswer",boardDTO);
	}
	
	
	
	
}

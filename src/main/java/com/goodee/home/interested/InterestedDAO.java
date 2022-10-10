package com.goodee.home.interested;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InterestedDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.interested.InterestedDAO.";
	
	public int setInterested(InterestedDTO interestedDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setInterested",interestedDTO);
	}
	
	public List<InterestedDTO> getInterestedUser(InterestedDTO interestedDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getInterestedUser", interestedDTO);
	}
	
	public int setDeleteInterested(InterestedDTO interestedDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteInterested",interestedDTO);
	}
}

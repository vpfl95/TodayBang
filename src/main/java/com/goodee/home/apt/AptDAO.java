package com.goodee.home.apt;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.home.realEstate.RealEstateDTO;


@Repository
public class AptDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.apt.AptDAO.";
	
	public List<RealEstateDTO> getAptRoadName(AptDTO aptDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAptRoadName",aptDTO);
	}
	
	public List<AptDTO> getList(AptDTO aptDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", aptDTO);
	}
	
}

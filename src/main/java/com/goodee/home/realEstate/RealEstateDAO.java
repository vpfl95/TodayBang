package com.goodee.home.realEstate;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RealEstateDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.realEstate.RealEstateDAO.";
	
	public List<RealEstateDTO> getAptRoadName()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAptRoadName");
	}
	
	public int setAddMM(RealEstateDTO realEstateDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddMM", realEstateDTO);
	}
	
	public int setAddJS(RealEstateDTO realEstateDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddJS", realEstateDTO);
	}
	
	public int setAddWS(RealEstateDTO realEstateDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddWS", realEstateDTO);
	}
	
	public List<RealEstateDTO> getHaddress(String search)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHaddress", search);
	}
}

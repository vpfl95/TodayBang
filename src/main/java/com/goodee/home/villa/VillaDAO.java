package com.goodee.home.villa;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.home.apt.AptDTO;
import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.util.MaemulPager;

@Repository
public class VillaDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.villa.VillaDAO.";
	
	public List<RealEstateDTO> getVillaRoadName(VillaDTO villaDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getVillaRoadName",villaDTO);
	}
	
	public List<VillaDTO> getList(MaemulPager maemulPager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", maemulPager);
	}
	
	public Long getTotalCount(MaemulPager maemulPager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", maemulPager);
	}
	
	public List<VillaDTO> getSearchAddressList(String search)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSearchAddressList", search);
	}
	
	public List<VillaDTO> getSearchVillaList(String search)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSearchVillaList", search);
	}
}

package com.goodee.home.region;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegionDAO {
	
	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "com.goodee.home.region.RegionDAO."; 
	
	public List<RegionDTO> getSido(RegionDTO regionDTO)throws Exception{
		return session.selectList(NAMESPACE + "getSido",regionDTO);
	}
	
	public List<RegionDTO> getSigungu(RegionDTO regionDTO)throws Exception{	
		return session.selectList(NAMESPACE + "getSigungu",regionDTO);
	}
	
	public List<RegionDTO> getEmd(RegionDTO regionDTO)throws Exception{
		return session.selectList(NAMESPACE + "getEmd",regionDTO);
	}
}

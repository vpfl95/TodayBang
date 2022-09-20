package com.goodee.home.store.exhibition;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitionDAO {

	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.goodee.home.store.exhibition.ExhibitionDAO.";
	
	public List<ExhibitionDTO> getExhibition() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getExhibition");
	}
}
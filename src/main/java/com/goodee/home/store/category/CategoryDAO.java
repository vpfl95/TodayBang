package com.goodee.home.store.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.store.category.CategoryDAO.";

	public List<CategoryDTO> getCategory() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCategory");
	}
	
	public int setCategory(Cate_ProductDTO cate_ProductDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setCategory", cate_ProductDTO);
	}
	
	public List<CategoryDTO> getTier1() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getTier1");
	}
	
	public List<CategoryDTO> getCateDetail(String category) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCateDetail",category);
	}
}

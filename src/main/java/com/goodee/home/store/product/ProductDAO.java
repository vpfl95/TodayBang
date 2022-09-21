package com.goodee.home.store.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.home.store.impl.OptionDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.goodee.home.store.product.ProductDAO.";
	
	public int setProduct(ProductDTO productDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProduct", productDTO);
	}
	
	public List<CategoryDTO> getCategory() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCategory");
	}
	
	public int setCategory(Cate_ProductDTO cate_ProductDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setCategory", cate_ProductDTO);
	}
	
	public int setOption(OptionDTO optionDTO, int num) {
		return sqlSession.insert(NAMESPACE+"setOption"+num, optionDTO);
	}
}
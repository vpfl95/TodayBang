package com.goodee.home.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import com.goodee.home.service.QnaDTO;
import com.goodee.home.store.product.ProductOptionDTO;
import com.goodee.home.store.review.ProductReviewDTO;
import com.goodee.home.util.Pager;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAMESPACE = "com.goodee.home.member.MemberDAO.";
	
	
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		
		
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberDTO);
	}
	
	public int getJoin(MemberDTO memberDTO) throws Exception{
		
		
		return sqlSession.insert(NAMESPACE + "getJoin", memberDTO);
	}
	
	public int setJoinRole(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE + "setJoinRole", memberDTO);
	}
	
	
	
	
	public MemberDTO getJoinOverlab(MemberDTO memberDTO) throws Exception{
		
		
		
		return sqlSession.selectOne(NAMESPACE+"getJoinOverlab",memberDTO);
	}
	
	public int setUpdate(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.update(NAMESPACE+"setUpdate", memberDTO);
	}
	
	
	public int setUpdatePw(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.update(NAMESPACE+"setUpdatePw", memberDTO);
	}
	
	public List<DeliveryDTO> getDelivery(MemberDTO memberDTO) throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+"getDelivery", memberDTO);
	}
	public int setDelivery(DeliveryDTO deliveryDTO) throws Exception{
		
		
		return sqlSession.insert(NAMESPACE+"setDelivery", deliveryDTO);
	}
	
	public int updateDelivery(DeliveryDTO deliveryDTO)throws Exception{
		
		
		return sqlSession.update(NAMESPACE+"updateDelivery", deliveryDTO);
	}
	
	public int deleteDelivery(DeliveryDTO deliveryDTO)throws Exception{
		
		
		return sqlSession.delete(NAMESPACE+"deleteDelivery", deliveryDTO);
	}
	
	public int setProfileImg(MemberFileDTO memberFileDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+ "setProfileImg",memberFileDTO);
	}
	
	public int updateProfileImg(MemberFileDTO memberFileDTO) throws Exception{
		
		return sqlSession.update(NAMESPACE+ "updateProfileImg",memberFileDTO);
	}
	
	
	public int deleteProfileImg(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE+ "deleteProfileImg",memberDTO);
	}
	
	public int dropMember(MemberDTO memberDTO)throws Exception{
		
		
		sqlSession.delete(NAMESPACE+"dropMemberRank",memberDTO);
		return sqlSession.delete(NAMESPACE+ "dropMember",memberDTO);
	}
	
	public MemberDTO findId(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+ "findId",memberDTO);
	}
	public MemberDTO findPw(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+ "findPw",memberDTO);
	}
	
	
	public List<CartDTO> getCart(MemberDTO memberDTO) throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+ "getCart",memberDTO);
	}
	
	

	public List<OrderDTO> getOrder(MemberDTO memberDTO) throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+ "getOrder",memberDTO);
	}
	
	public int addCart(CartDTO cartDTO) throws Exception{
		
		
		return sqlSession.insert(NAMESPACE+ "addCart",cartDTO);
	}
	public int deleteCart(CartDTO cartDTO) throws Exception{
		
		
		return sqlSession.delete(NAMESPACE+ "deleteCart",cartDTO);
	}
	public List<QnaDTO> getMyQna(Pager pager) throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+ "getMyQna",pager);
	}
	public Long getCount(Pager pager) throws Exception{
		
		
		return sqlSession.selectOne(NAMESPACE+ "getCount",pager);
	}
	
	public List<ProductReviewDTO> getMyPdReview(MemberDTO memberDTO)throws Exception{
		
		
		return sqlSession.selectList(NAMESPACE+ "getMyPdReview",memberDTO);
	}
	
}

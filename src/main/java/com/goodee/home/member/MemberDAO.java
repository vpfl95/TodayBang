package com.goodee.home.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		
	System.out.println(" insert img ");
		
		return sqlSession.insert(NAMESPACE+ "setProfileImg",memberFileDTO);
	}
	
	public int updateProfileImg(MemberFileDTO memberFileDTO) throws Exception{
		
		System.out.println("update img ");
		return sqlSession.update(NAMESPACE+ "updateProfileImg",memberFileDTO);
	}
	
	
}

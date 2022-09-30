package com.goodee.home.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.goodee.home.member.MemberDTO;
import com.goodee.home.member.RoleDTO;
import com.goodee.home.util.Pager;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String NAMESPACE = "com.goodee.home.admin.AdminDAO.";
	
	public List<MemberDTO> getMember(Pager pager) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"getMember",pager);
	}
	
	public Long getMemberCount() throws Exception{
		
		
		return sqlSession.selectOne(NAMESPACE+"getMemberCount");
	}
	
	public int updateMemberRank(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.update(NAMESPACE+"updateMemberRank",memberDTO);
	}
	
	public int addMemberRank(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.insert(NAMESPACE+"addMemberRank",memberDTO);
	}
	
	public int deleteMemberRank(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE+"deleteMemberRank",memberDTO);
	}
	
	public MemberDTO getDetailMember(MemberDTO memberDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getDetailMember",memberDTO);
	}
	
	public List<RoleDTO> getRole() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getRole");
	}
	
}

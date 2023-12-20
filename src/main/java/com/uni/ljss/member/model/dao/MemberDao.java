package com.uni.ljss.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.stereotype.Repository;

import com.uni.ljss.member.model.dto.Member;


@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		Member m1 = sqlSession.selectOne("memberMapper.loginMember", m);
		return m1;
	}
	
  public Member forgetId(SqlSessionTemplate sqlSession, Member m) {
		
	  Member m2 = sqlSession.selectOne("memberMapper.forgetId", m);
		return m2;
 	}
  
  public Member forgetPwd(SqlSessionTemplate sqlSession, Member m) {
		
	  Member m3 = sqlSession.selectOne("memberMapper.forgetPwd", m);
		return m3;
 	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m );
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMember", m );
	}
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.updatePwd",m);
	}
	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.idCheck", memId);
	}


	public int deleteMember(SqlSessionTemplate sqlSession, String memId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("memberMapper.deleteMember", memId);
	}

	
	

}
package com.uni.ljss.membermgt.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.ljss.membermgt.model.dto.Member2;
import com.uni.ljss.membermgt.model.dto.PageInfo;


@Repository
public class MemberDao2 {

	//회원관리 리스트 나오게끔
	public Member2 selectMember(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMember", mno);
	}
	
	public ArrayList<Member2> selectList2(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList");
	}

	public int deleteMember2(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("memberMapper.deleteMember2", mno);
	}

	public int inceaseCount(SqlSessionTemplate sqlSession, int mno) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.increaseCount", mno);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	public int update(SqlSessionTemplate sqlSession, Member2 member) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.update", member);
	}
}
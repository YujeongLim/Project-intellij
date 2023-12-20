package com.uni.ljss.membermgt.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.ljss.common.CommException;
import com.uni.ljss.membermgt.model.dao.MemberDao2;
import com.uni.ljss.membermgt.model.dto.Member2;
import com.uni.ljss.membermgt.model.service.MemberService2;
import com.uni.ljss.membermgt.model.dto.PageInfo;


//@EnableAspectJAutoProxy
//@Transactional(rollbackFor = {Exception.class})   
@Service
public class MemberServiceImpl22 implements MemberService2 {

	@Autowired
	private MemberDao2 memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Member2> selectList2() {
		// TODO Auto-generated method stub
		return memberDao.selectList2(sqlSession);
	}
	

	@Override
	public void deleteMember2(int mno) throws Exception {
		int result = memberDao.deleteMember2(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("회원삭제 실패");
		}
		
	}
	

	@Override
	public Member2 selectMember(int mno) {
		Member2 m = null;
		
		int result = memberDao.inceaseCount(sqlSession, mno);
		if(result < 0) {
			throw new CommException("inceaseCount 실패");
		}else {
			m = memberDao.selectMember(sqlSession, mno);
		}
		return m;
	}
	
	@Override
	public Member2 selectMember2(int memCode) {

		Member2	m = memberDao.selectMember(sqlSession, memCode);

		return m;
	}


	@Override
	public int selectListCount() {
		return memberDao.selectListCount(sqlSession);
	}

	@Override
	public void update(Member2 member) {
		memberDao.update(sqlSession, member);
	}


	




	

}

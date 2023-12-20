package com.uni.ljss.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.uni.ljss.common.CommException;
import com.uni.ljss.member.model.dao.MemberDao;
import com.uni.ljss.member.model.dto.Member;


//@EnableAspectJAutoProxy
//@Transactional(rollbackFor = {Exception.class})   
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) throws Exception {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		System.out.println("loginUser  : " + loginUser);
		
		
		if(loginUser == null) {
			throw new Exception("loginUser확인");
		}
		if (!m.getMemPwd().equals(loginUser.getMemPwd())) {
		    throw new CommException("암호 불일치");
		}
		return loginUser;
	}
	
	
	@Override
	public Member forgetId(Member m) throws Exception {
		
		Member forgetmemId = memberDao.forgetId(sqlSession, m);
		
		if(forgetmemId == null) {
			throw new CommException("사용자 없습니다.");
		}
		return forgetmemId;
		
	}
	
	@Override
	public Member forgetPwd(Member m) throws Exception {
		
		Member forgetmemPwd = memberDao.forgetPwd(sqlSession, m);
		
		if(forgetmemPwd == null) {
			throw new CommException("사용자 없습니다.");
		}
		return forgetmemPwd;
		
	}
	
	

	@Override
	public void insertMember(Member m) {
		
		int result = memberDao.insertMember(sqlSession, m);
		
		if(result < 0 ) {
			throw new CommException("회원가입에 실패 하였습니다.");
		}
	}
	
	@Override
	public int idCheck(String memId) {
		int result = memberDao.idCheck(sqlSession, memId);
		
		if(result < 0 ) {
			throw new CommException("아이디체크에 실패하였습니다.");
		}
		return result;
	}


	

	


	
		

//	@Override
//	public Member updateMember(Member m) throws Exception {
//		
//		int result = memberDao.updateMember(sqlSession, m);
//		//memberDao.insertMember(sqlSession, m);
//		if(result > 0) {
//			Member loginUser = memberDao.loginMember(sqlSession, m);
//			return loginUser;
//		}else {
//			throw new Exception("회원수정실패");
//		}
//		
//
//	}

	
//	@Override
//	public void deleteMember(String memId) throws Exception  {
//		int result = memberDao.deleteMember(sqlSession, memId);
//		
//		if(result < 0) {
//			throw new CommException("회원삭제 실패");
//		}
//		
//	}

//	@Override
//	public void updatePwd(Member m) throws Exception {
//		int result = memberDao.updatePwd(sqlSession,m);
//		
//		if(result>0) {
//			Member loginUser = memberDao.loginMember(sqlSession, m);
//		}else {
//			throw new CommException("비밀번호 변경 실패");
//		}	
//	}



	

	

	

	

	
	
	
	
}

package com.uni.ljss.membermgt.model.service;

import java.util.ArrayList;

import com.uni.ljss.membermgt.model.dto.Member2;
import com.uni.ljss.membermgt.model.dto.PageInfo;


public interface MemberService2 {

	
	Member2 selectMember(int bno);
	
	Member2 selectMember2(int bno);

	
	//회원관리 리스트 나오게끔
	ArrayList<Member2> selectList2();

	void deleteMember2(int mno) throws Exception ;

	int selectListCount();

	void update(Member2 member);


}

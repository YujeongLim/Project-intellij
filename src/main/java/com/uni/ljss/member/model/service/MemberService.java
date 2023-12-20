package com.uni.ljss.member.model.service;





import java.util.ArrayList;


import com.uni.ljss.member.model.dto.Member;
import com.uni.ljss.membermgt.model.dto.PageInfo;

public interface MemberService {

	Member loginMember(Member m) throws Exception;

	void insertMember(Member m);

	//Member updateMember(Member m) throws Exception;

	int idCheck(String memId);

	//void deleteMember(String memId) throws Exception ;


	//void updatePwd(Member m) throws Exception;
	

	Member forgetId(Member m) throws Exception;

	Member forgetPwd(Member m) throws Exception;





}

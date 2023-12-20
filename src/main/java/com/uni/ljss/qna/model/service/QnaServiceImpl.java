package com.uni.ljss.qna.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.ljss.common.CommException;
import com.uni.ljss.qna.model.dao.QnaDao;
import com.uni.ljss.qna.model.dto.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QnaDao qnaDao;
	

	@Override
	public void insertQna(Qna q) {
		
		int result = qnaDao.insertQna(sqlSession, q);
		
		if(result < 0) {
			throw new CommException("게시글추가실패 ");
		}
		
	}


}


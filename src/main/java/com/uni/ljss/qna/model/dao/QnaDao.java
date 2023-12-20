package com.uni.ljss.qna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.ljss.qna.model.dto.Qna;

@Repository
public class QnaDao {


	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaMapper.insertQna", q);
	}

	public int inceaseCount(SqlSessionTemplate sqlSession, int qno) {
		// TODO Auto-generated method stub
		return sqlSession.update("qnaMapper.increaseCount", qno);
	}

}

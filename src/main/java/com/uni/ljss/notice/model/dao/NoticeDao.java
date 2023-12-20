package com.uni.ljss.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.ljss.notice.model.dto.Notice;
import com.uni.ljss.notice.model.dto.PageInfo1;

@Repository
public class NoticeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo1 pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getNoticeLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getNoticeLimit());
		

		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int inceaseCount(SqlSessionTemplate sqlSession, int nno) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.increaseCount", nno);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int nno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeMapper.selectNotice", nno);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nno) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeMapper.deleteNotice", nno);
	}


	public ArrayList<Notice> selectTopList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopList");
	}
}

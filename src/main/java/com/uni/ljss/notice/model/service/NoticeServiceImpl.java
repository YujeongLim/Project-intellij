package com.uni.ljss.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.ljss.common.CommException;
import com.uni.ljss.notice.model.dao.NoticeDao;
import com.uni.ljss.notice.model.dto.Notice;
import com.uni.ljss.notice.model.dto.PageInfo1;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int selectListCount() {
		
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo1 pi) {
		// TODO Auto-generated method stub
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	public void insertNotice(Notice n) {
		
		int result = noticeDao.insertNotice(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("게시글추가실패 ");
		}
		
	}

	@Override
	public Notice selectNotice(int nno) {
		Notice n = null;
		
		int result = noticeDao.inceaseCount(sqlSession, nno);
		if(result < 0) {
			throw new CommException("inceaseCount 실패");
		}else {
			n = noticeDao.selectNotice(sqlSession, nno);
		}
		return n;
	}

	@Override
	public void updateNotice(Notice n) {
		int result = noticeDao.updateNotice(sqlSession, n);
		
		if(result < 0) {
			throw new CommException("게시글수정실패 ");
		}
		
		
	}

	@Override
	public void deleteNotice(int nno) {
	int result = noticeDao.deleteNotice(sqlSession, nno);
		
		if(result < 0) {
			throw new CommException("게시글삭제실패 ");
		}
	}

//	@Override
//	public ArrayList<Reply> selectReplyList(int nno) {
//		
//		return noticeDao.selectReplyList(sqlSession , nno);
//	}
//
//	@Override
//	public int insertReply(Reply r) {
//	int result = noticeDao.insertReply(sqlSession, r);
//		
//		if(result < 0) {
//			throw new CommException("댓글추가실패 ");
//		}
//		return result;
//	}

	@Override
	public ArrayList<Notice> selectTopList() {
		// TODO Auto-generated method stub
		return noticeDao.selectTopList(sqlSession);
	}
	

}


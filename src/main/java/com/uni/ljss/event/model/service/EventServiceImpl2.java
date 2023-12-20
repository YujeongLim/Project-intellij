package com.uni.ljss.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uni.ljss.common.CommException;
import com.uni.ljss.event.model.dao.EventDao;
import com.uni.ljss.event.model.dto.Event;


//@EnableAspectJAutoProxy
//@Transactional(rollbackFor = {Exception.class})   
@Service
public class EventServiceImpl2 implements EventService {

	@Autowired
	private EventDao eventDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Event> selectList() {
		// TODO Auto-generated method stub
		return eventDao.selectList(sqlSession);
	}
	
	@Override
	public Event selectEvent(int eno) {

		Event e = eventDao.selectEvent(sqlSession, eno);

		return e;
	}


	@Override
	public int selectListCount() {
		return eventDao.selectListCount(sqlSession);
	}

	@Override
	public void updateEvent(Event e) {
		int result = eventDao.updateEvent(sqlSession, e);
		
		if(result < 0) {
			throw new CommException("이벤트수정실패 ");
		}
	}


	@Override
	public void insertEvent(Event e) {
		
		int result = eventDao.insertEvent(sqlSession, e);
		
		if(result < 0) {
			throw new CommException("이벤트추가실패 ");
		}
		
	}
	
	@Override
	public void deleteEvent(int eno){
		int result = eventDao.deleteEvent(sqlSession, eno);
		
		if(result < 0) {
			throw new CommException("이벤트삭제 실패");
		}
	}

}

package com.uni.ljss.event.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.uni.ljss.event.model.dto.Event;


@Repository
public class EventDao {

	//이벤트 리스트 나오게끔
	public Event selectEvent(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("eventMapper.selectEvent", eno);
	}
	
	//페이징
//	public ArrayList<Member2> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
//		
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		
//
//		return (ArrayList)sqlSession.selectList("eventMapper.selectList", null, rowBounds);
//	}
	
	public ArrayList<Event> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectList");
	}


	public int deleteEvent(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("eventMapper.deleteEvent", eno);
	}

	public int inceaseCount(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.increaseCount", eno);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("eventMapper.selectListCount");
	}

	public int updateEvent(SqlSessionTemplate sqlSession, Event event) {
		// TODO Auto-generated method stub
		return sqlSession.update("eventMapper.updateEvent", event);
	}
	
	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		// TODO Auto-generated method stub
		return sqlSession.insert("eventMapper.insertEvent", e);
	}
}
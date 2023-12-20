package com.uni.ljss.event.model.service;

import java.util.ArrayList;

import com.uni.ljss.event.model.dto.Event;


public interface EventService {

	//회원관리 리스트 나오게끔
	Event selectEvent(int eno);

	ArrayList<Event> selectList();

	void insertEvent(Event e);

	void updateEvent(Event e);
	
	void deleteEvent(int eno);

	int selectListCount();


}

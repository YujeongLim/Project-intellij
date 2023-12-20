package com.uni.ljss.notice.model.service;

import java.util.ArrayList;

import com.uni.ljss.notice.model.dto.Notice;
import com.uni.ljss.notice.model.dto.PageInfo1;

public interface NoticeService {

	int selectListCount();
	
	ArrayList<Notice> selectList(PageInfo1 pi);
	
	void insertNotice(Notice n);
	
	Notice selectNotice(int nno);
	
	void updateNotice(Notice n);
	
	void deleteNotice(int nno);
	
	ArrayList<Notice> selectTopList();
}

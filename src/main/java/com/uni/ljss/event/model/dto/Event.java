package com.uni.ljss.event.model.dto;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Event {
	private Integer eventCode; 
	private String eventName;
	private String eventDetail;
	private Date eventAddDate;
	private String eventPhoto;

//	private String originName;
//	private String changeName;
	

    
}
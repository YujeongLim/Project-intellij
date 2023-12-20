package com.uni.ljss.qna.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Qna {
	
	private int qnaNo;
	private String qnaTitle;
	private String qnaWriter;
	private String qnaContent;
	private String originName;
	private String changeName;
	private int count;
	private Date createDate;
	private String status;
	

}

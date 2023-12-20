package com.uni.ljss.member.model.dto;

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
public class Member {
	private String memCode; 
	private String memAdmin;
	private String memName;
	private String memBirth;
	private String gender;
	private String memId;
	private String memPwd;
	private String memPhone;
	private String memAdrr;
	private String memEmail;
	private Date memAccdate;
	private String memOut;
	
}
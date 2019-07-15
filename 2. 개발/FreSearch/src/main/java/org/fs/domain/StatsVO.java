package org.fs.domain;

import lombok.Data;

@Data
public class StatsVO {
	
	//subject
	private String subjCode;
	private String ctgrCode;
	private String mbEmail;
	private String mbNick;
	private String subjNm;
	private String subjRegdate;
	private String subjStartDate;
	private String subjEndDate;
	
	//member
	private String mbAttCtgrCode;
	private String mbPwd;
	private String mbAddr;
	private String mbBirthDate;
	private String mbSex;
	private String mbPhone;
	private String mbRegAtrt;
	private String mbJoinDate;
	
	//attCategory
	private String bmAttCtgrCode;
	private String ctgrCode1;
	private String ctgrCode2;
	private String ctgrCode3;
	private String ctgrCode4;
	private String ctgrCode5;
	private String mbMarriageYn;
	private String mbChildYn;
	private String mbHomeYn;
	private String mbCarYn;
	
	//getAge
	private int age;
	
	
	
}

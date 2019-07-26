package org.fs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StatsVO {
	
	//subject
	private String subjCode;
	private String ctgrCode;
	private String mbEmail;
	private String mbNick;
	private String subjNm;
	private Date subjRegdate;
	private Date subjStartDate;
	private Date subjEndDate;
	
	//member
	private String mbAttCtgrCode;
	private String mbPwd;
	private String mbAddr;
	private String mbBirthDate;
	private String mbSex;
	private String mbPhone;
	private String mbRegAtrt;
	private int mbZipCode;
	private String mbAddrDetail;
	private String mbEmailConfirm;
	private Date mbJoinDate;
	
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
	
	
	
	///////
	private int ANSWER_NUMBER;
	private Date SUBJ_REGDATE;
	private String ctgr_nm;
	private String MB_NICK;
	private String QST_IMG;
	private String SUBJ_NM;
	private Date SUBJ_STARTDATE;
	private Date SUBJ_ENDDATE;
	
	
	
	
	private int count;
	private String ctgr_code;
	private String percent;
	
	
	
	
	
}

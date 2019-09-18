package org.fs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StatsVO {
	
	//subject
	private String subj_code;
	private String ctgr_code;
	private String mb_email;
	private String mb_nick;
	private String subj_nm;
	private Date subj_regdate;
	private Date subj_startdate;
	private Date subj_enddate;
	
	//member
	private String mb_att_ctgr_code;
	private String mb_pwd;
	private String mb_addr;
	private String mb_birthdate;
	private String mb_sex;
	private String mb_phone;
	private String mb_reg_atrt;
	private Date mb_joindate;
	
	//attCategory
	
	private String ctgr_code1;
	private String ctgr_code2;
	private String ctgr_code3;
	private String ctgr_code4;
	private String ctgr_code5;
	private String mb_marriage_yn;
	private String mb_child_yn;
	private String mb_home_yn;
	private String mb_car_yn;
	
	//getAge
	private int age;
	
	private int answer_number;
	private String ctgr_nm;
	private String qst_img;

	
	private int count;
	private String percent;
	
	private int startAge;
	private int endAge;
	
	private String stats;
	
	///question
	private String qst_code;
	private String qst_content;
	private String qst_type;
	
	//answer
	private String asw_content;
	
	///item
	private String item_code;
	private String item_content;
	private Date item_regdate;
	private String item_img;
	private String asw_count;
}

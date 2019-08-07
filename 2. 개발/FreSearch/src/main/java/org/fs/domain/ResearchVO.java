package org.fs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ResearchVO {
	
	//카테고리
	private String ctgr_code;  // 카테고리코드
	private String ctgr_nm;    // 카테고리명
	
	//주제
	private String subj_code; 	   // 주제코드
	private String mb_email;   	   // 이메일
	private String mb_nick;	   	   // 닉네임
	private String subj_nm;		   // 주제명
	private Date subj_regdate;	   // 등록일
	private Date subj_startdate;   // 시작일
	private Date subj_enddate;	   // 종료일
	
	//질문
	private String qst_code;	// 질문코드
	private String qst_content; // 질문내용
	private String qst_type;	// 질문유형
	private String qst_img;		// 이미지
	private String qst_url;		// URL
	private Date qst_regdate;	// 등록일
	
	//아이템
	private String item_code;	 // 아이템코드
	private String item_content; // 아이템내용
	private String item_img;	 // 이미지
	private Date item_regdate;	 // 등록일
	
	private String research;
	//private int researchCnt;
}

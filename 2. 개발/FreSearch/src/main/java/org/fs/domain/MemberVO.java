package org.fs.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String mb_email;		 // 이메일
	private String mb_att_ctgr_code; // 관심카테고리
	private String mb_nick;		 	 // 닉네임
	private String mb_pwd;			 // 비밀번호
	private String mb_addr;		 	 // 거주지
	private int mb_birthdate;		 // 생년월일
	private String mb_sex;			 // 성별
	private String mb_phone;		 // 전화번호
	private String mb_reg_atrt;		 // 등록권한
	private String mb_email_key; 	 // 이메일인증
	private Date mb_joindate;		 // 가입일
	
	private String ctgr_code1;		 // 카테고리코드1
	private String ctgr_code2;		 // 카테고리코드2
	private String ctgr_code3;		 // 카테고리코드3
	private String ctgr_code4;		 // 카테고리코드4
	private String ctgr_code5;		 // 카테고리코드5
	private String mb_marriage_yn;	 // 결혼유무
	private String mb_child_yn;		 // 자녀유무
	private String mb_home_yn;		 // 자가유무
	private String mb_car_yn;		 // 자차유무
	
	private String auth; //권한
	private List<AuthVO> authList;
}

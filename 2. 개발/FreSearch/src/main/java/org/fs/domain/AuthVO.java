package org.fs.domain;

import lombok.Data;

@Data
public class AuthVO {
	private String mb_email;		 // 이메일
	private String mb_att_ctgr_code; // 관심카테고리코드
	private String auth;			 // 권한
}

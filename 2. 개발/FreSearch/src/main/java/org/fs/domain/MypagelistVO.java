package org.fs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MypagelistVO {
	private String subj_code;		// 질문코드
	private String mb_email;		// 이메일
	private String mb_nick;			// 닉네임
	private String subj_nm;			// 질문명
	private String ctgr_nm;			// 카테고리명
	private Date subj_startdate;	// 설문시작일
	private Date subj_enddate;		// 설문종료일
}

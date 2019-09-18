package org.fs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ApplyVO {
	private int apply_code;				// 신청 코드
	private String mb_email; 			// 이메일
	private Date apply_applydate;		// 신청일
	private Date apply_approvaldate;	// 승인일
}

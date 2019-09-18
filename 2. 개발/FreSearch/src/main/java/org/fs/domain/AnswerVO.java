package org.fs.domain;

import java.util.Date;
import lombok.Data;

@Data
public class AnswerVO {
	private String asw_code;	// 답변코드
	private String item_code; 	// 아이템코드
	private String mb_email; 	// 이메일
	private String mb_nick; 	// 닉네임
	private String asw_content; // 답변내용
	private Date asw_regdate; 	// 답변등록일
}

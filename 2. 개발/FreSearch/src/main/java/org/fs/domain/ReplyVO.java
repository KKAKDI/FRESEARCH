package org.fs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int rpl_code;			//댓글코드
	private int brd_code;			//게시판코드
	private String rpl_content;		//게시판 내용
	private String mb_nick;			//작성자 닉네임
	private String mb_email;		//작성자 이메일
	private Date rpl_regdate;		//등록일자
}

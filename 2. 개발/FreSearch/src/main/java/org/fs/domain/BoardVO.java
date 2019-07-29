package org.fs.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private int brd_code;			//게시판코드
	private String mb_email;			//이메일
	private String mb_nick;				//닉네임
	private String brd_subject;		//제목
	private String brd_content;		//내용
	private String brd_attach_file; 	//첨부파일
	private int brd_like_cnt; 			//추천수
	private int brd_dislike_cnt; 		//비추천수
	private int brd_report_cnt;  		//신고횟수
	private String brd_regkey;			//등록키
	private int brd_views;				//조회수
	private Date brd_regdate;			//등록일
	private String brd_attach_uuid;	//첨부파일 썸네일		

}

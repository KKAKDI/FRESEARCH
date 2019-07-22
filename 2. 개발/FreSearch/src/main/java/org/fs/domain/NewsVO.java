package org.fs.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NewsVO {
	private int news_code; 				// 새소식코드
	private String news_division;		// 구분
	private String news_subject;		// 제목
	private String news_content;		// 내용
	private int news_views;				// 조회수
	private Date news_regdate;			// 등록일
	
	private List<NewsAttachVO> AttachList; // 첨부파일 
}

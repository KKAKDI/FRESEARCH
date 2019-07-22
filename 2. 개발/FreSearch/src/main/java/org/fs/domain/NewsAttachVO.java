package org.fs.domain;

import lombok.Data;

@Data
public class NewsAttachVO {
	private String news_attach_uuid;		// 첨부파일 uuid
	private String news_attach_path;		// 첨부파일 경로
	private String news_attach_name;		// 첨부파일
	private boolean news_attach_type;		// 첨부파일 이미지파일 여부
	private int news_code;				// 새소식 코드
}

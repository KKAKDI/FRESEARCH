package org.fs.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	private String brd_attach_uuid;		// 게시판 첨부파일 uuid
	private String brd_attach_path;		// 게시판 첨부파일 경로
	private String brd_attach_name;		// 게시판 첨부파일
	private boolean brd_attach_type;	// 게시판 첨부파일 이미지 Y/N
	private int brd_code;				// 게시판 코드
}

package org.fs.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	private String fileName;	// 파일명
	private String uploadPath;	// 파일업로드경로
	private String uuid;		// 중복방지용 랜덤 파일명
	private boolean image;		// 이미지여부
}

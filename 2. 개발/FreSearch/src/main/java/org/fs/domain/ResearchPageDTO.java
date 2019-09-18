package org.fs.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ResearchPageDTO {
	private int researchCnt;		// 설문갯수
	private List<ResearchVO> list;	// 설문목록
}

package org.fs.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ResearchPageDTO {
	private int researchCnt;
	private List<ResearchVO> list;
}

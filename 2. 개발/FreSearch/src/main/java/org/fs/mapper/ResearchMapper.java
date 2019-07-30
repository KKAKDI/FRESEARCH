package org.fs.mapper;

import java.util.List;

import org.fs.domain.ResearchVO;

public interface ResearchMapper {
	
	public List<ResearchVO> listStatus(ResearchVO vo);
	
}

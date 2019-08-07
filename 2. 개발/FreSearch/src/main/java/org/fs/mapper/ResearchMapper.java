package org.fs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.fs.domain.Criteria;
import org.fs.domain.ResearchVO;

public interface ResearchMapper {
	
	//public List<ResearchVO> listStatus(ResearchVO vo);
	public List<ResearchVO> list(
			@Param("cri") Criteria cri,
			@Param("research") String research);
	public int getCountBySubjCode(
			@Param("research") String research);
}

package org.fs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.fs.domain.Criteria;
import org.fs.domain.ResearchVO;

public interface ResearchMapper {
	
	public int subjReg(ResearchVO vo);
	public int qstReg(ResearchVO vo);
	public int itemReg(ResearchVO vo);
	public List<ResearchVO> list(	@Param("cri") Criteria cri);
}

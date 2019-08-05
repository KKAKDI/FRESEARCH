package org.fs.service;

import java.util.List;

import org.fs.domain.ResearchVO;

public interface ResearchService {
	
	public List<ResearchVO> listStatus(ResearchVO vo);
	public void subjReg(ResearchVO vo);
	public void qstReg(ResearchVO vo);
	public void itemReg(ResearchVO vo);
}

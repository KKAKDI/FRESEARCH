package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;

public interface ResearchService {
	
	public void subjReg(ResearchVO vo);
	public void qstReg(ResearchVO vo);
	public void itemReg(ResearchVO vo);
	public ResearchPageDTO list(Criteria cri);
}

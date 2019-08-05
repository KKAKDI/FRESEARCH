package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;

public interface ResearchService {
	
	public void researchReg(String values);
	public ResearchPageDTO list(Criteria cri);
}

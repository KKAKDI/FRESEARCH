package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;

public interface ResearchService {
	
	public ResearchPageDTO list(Criteria cri, String research);
	public void researchReg(String values);
}

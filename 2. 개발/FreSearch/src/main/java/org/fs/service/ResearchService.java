package org.fs.service;

import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;

public interface ResearchService {
	
	//public List<ResearchVO> listStatus(ResearchVO vo);
	public ResearchPageDTO list(Criteria cri, String research);
}

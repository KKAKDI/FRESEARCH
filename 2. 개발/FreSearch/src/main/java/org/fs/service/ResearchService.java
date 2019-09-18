package org.fs.service;

import java.util.List;
import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;

public interface ResearchService {	
	public List<ResearchVO> researchContent(String subj_code);
	public ResearchPageDTO list(Criteria cri, String research);
	public void researchReg(String values);
	public void researchAnswer(String values);
	public void researchDelete(String subj_code);
}

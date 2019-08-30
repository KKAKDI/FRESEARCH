package org.fs.service;

import java.util.List;

import org.fs.domain.ApplyVO;
import org.fs.domain.Criteria;

public interface ApplyService {
	public ApplyVO registedChk(String mb_email);
	
	public boolean regist(ApplyVO apply);
	
	public boolean approval(String mb_email);
	
	public String applyChk(String mb_email);
	
	public String atrtChk(String mb_email);
	
	public int getTotal(Criteria cri);
	
	public List<ApplyVO> getList(Criteria cri);
	
	
}

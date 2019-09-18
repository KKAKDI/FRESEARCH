package org.fs.mapper;

import java.util.List;

import org.fs.domain.ApplyVO;
import org.fs.domain.Criteria;
import org.fs.domain.NewsVO;

public interface ApplyMapper {
	public ApplyVO selectEmail(String mb_email);
	
	public String applyChk(String mb_email);
	
	public String atrtChk(String mb_email);
	
	public int getTotalCount(Criteria cri);
	
	public List<ApplyVO> getListWithPaging(Criteria cri);
	
	public boolean insertApply(ApplyVO apply);
	
	public boolean updateApproval(String mb_email);
	
	public boolean updateAtrt(String mb_email);
}

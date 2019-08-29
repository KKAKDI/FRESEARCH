package org.fs.mapper;

import java.util.List;

import org.fs.domain.ApplyVO;
import org.fs.domain.Criteria;
import org.fs.domain.NewsVO;

public interface ApplyMapper {
	
	//@Select("select * from NEWS where NEWS_CODE > 0")
	
	public ApplyVO selectEmail(String mb_email);
	
	public String applyChk(String mb_email);
	
	public int getTotalCount(Criteria cri);
	
	public List<ApplyVO> getListWithPaging(Criteria cri);
	
	//public List<NewsVO> getList();
	
	//public List<NewsVO> getListWithPaging(Criteria cri);
	
	//public List<NewsVO> getListWithPagingEvent(Criteria cri);
	
	public boolean insertApply(ApplyVO apply);
	
	//public Integer insertSelectKey(NewsVO news);
	
	//public NewsVO read(int news_code);
	
	//public int delete(int news_code);
	
	//public void updateApply(String mb_email);
	
	public boolean updateApproval(String mb_email);
	
	public boolean updateAtrt(String mb_email);
	
	//public int getTotalCount(Criteria cri);
	
	//public int getTotalCountEvent(Criteria cri);
	
	//public List<NewsAttachVO> findByNews_code(int news_code);

}

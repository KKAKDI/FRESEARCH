package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);			//댓글 등록
	
	public ReplyVO content(int rpl_code); //댓글 보기
	
	public int modify (ReplyVO vo);			//댓글 수정
	
	public int remove(int rpl_code);			//댓글 삭제
	
	public List<ReplyVO> getList(Criteria ccri, int brd_code);		//댓글 페이징
	
}

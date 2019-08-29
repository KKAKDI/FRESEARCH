package org.fs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.fs.domain.Criteria;
import org.fs.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);		//댓글 등록
	
	public ReplyVO read(int brd_code);		//댓글 조회

	public int delete(int brd_code);			//댓글 삭제
	
	public int update(ReplyVO reply);		//댓글 등록
	
	public List<ReplyVO> getListPaging(
			@Param("cri") Criteria cri,
			@Param("brd_code") int brd_code);
			
	
}

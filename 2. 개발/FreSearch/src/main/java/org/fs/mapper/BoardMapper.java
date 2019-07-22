package org.fs.mapper;

import java.util.List;

import org.fs.domain.BoardVO;
import org.fs.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getList(); 							// 자유게시판 리스트 띄우기 
	
	public List<BoardVO> getListPaging(Criteria cri);		//자유게시판 페이징
	
	public int getTotalCount(Criteria cri); 						//페이징 전체 게시글수 표시
	
	public void insert(BoardVO board);							//자유게시판 게시글 등록(seq = null)
	
	public void insertSelectKey(BoardVO board);			//자유게시판 게시글 등록(seq DB 조회해서 다음값으로 먼저 입력해서 insert)
	
	public BoardVO read(int brd_code);						//자유게시판 조회를 원하는 게시글 조회 
		
	public int delete(int brd_code);								//게시글 삭제
	
	public int update(BoardVO board);							//원하는 해당 게시글 업데이트
	
	BoardVO BoardViews(BoardVO vo);
}

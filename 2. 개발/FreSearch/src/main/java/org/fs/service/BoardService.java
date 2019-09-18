package org.fs.service;

import java.util.List;

import org.fs.domain.BoardAttachVO;
import org.fs.domain.BoardVO;
import org.fs.domain.Criteria;

public interface BoardService {

	public void register(BoardVO Board);							//게시글 등록
	
	public BoardVO content(int brd_code);							//게시글 보기
	
	public boolean modify(BoardVO board);							//게시글수정
	
	public boolean delete(int brd_code); 							//게시글 삭제
			
	public List<BoardVO> getList(Criteria cri);						//게시글 리스트 보기,페이징
	
	public int getTotal(Criteria cri);								//페이징 전체 게시글 표시
	
	public List<BoardAttachVO> getAttachList(int brd_code);			//파일 업로드
	
	public void removeAttach(int brd_code); 						// 첨부파일 삭제

	public int brdViewCnt(int brd_code); 							//조회수 추가
}

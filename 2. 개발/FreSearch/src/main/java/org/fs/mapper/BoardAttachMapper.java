package org.fs.mapper;

import java.util.List; 

import org.fs.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);		//첨부파일 등록
	
	public void delete(String uuid);				//첨부파일 삭제
	
	public List<BoardAttachVO> findByBrd_code(int brd_code);	//게시글 번호 찾기
	
	public void deleteAll(int brd_code);		//게시글 삭제시 파일첨부 같이 삭제
	
	public List<BoardAttachVO> getOldFiles();
	
	
}

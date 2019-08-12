package org.fs.mapper;

import java.util.List; 

import org.fs.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBrd_code(int brd_code);
	
	
}

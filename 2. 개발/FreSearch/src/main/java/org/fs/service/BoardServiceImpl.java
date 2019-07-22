package org.fs.service;

import java.util.List;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.fs.domain.BoardVO;
import org.fs.domain.Criteria;
import org.fs.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	public void register(BoardVO board) {				//게시글 등록
		
		log.info("register:"+ board);
		
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO content(int brd_code) {			//게시글 보기
		
		log.info("content : " + brd_code);
		
		return  mapper.read(brd_code);
	}

	@Override
	public boolean modify(BoardVO board) {			//게시글 수정
		log.info("modify: "+ board);
		
		return mapper.update(board) ==1;
	}

	@Override
	public boolean delete(int brd_code) {				//게시글 삭제
		
		log.info("delete : " + brd_code);
		
		return mapper.delete(brd_code) ==1;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {					//게시글 리스트,페이징
		
		log.info("getListpaging!!!!!!!!!!! " );
		
		return mapper.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
	
		log.info("get totalCount");
		
		return mapper.getTotalCount(cri);
	}



	
	
	
}

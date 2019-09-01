package org.fs.service;

import java.util.List;

import org.fs.domain.BoardAttachVO;
import org.fs.domain.BoardVO;
import org.fs.domain.Criteria;
import org.fs.mapper.BoardAttachMapper;
import org.fs.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_= @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override												
	public void register(BoardVO board) {			//게시글 등록

		log.info("register......" + board);

		mapper.insertSelectKey(board);
		
		if(board.getAttachList()== null || board.getAttachList().size() <= 0) {
			return;
		}
		board.getAttachList().forEach(attach -> {
			
			attach.setBrd_code(board.getBrd_code());
			
			attachMapper.insert(attach);
		});
	}
	
	@Override
	public BoardVO content(int brd_code) {			//게시글 보기
		
		log.info("content : " + brd_code);
		
		return  mapper.read(brd_code);
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {			//게시글 수정

		log.info("modify......" + board);

		attachMapper.deleteAll(board.getBrd_code());
		
		boolean modifyResult = mapper.update(board) == 1;

		log.info("########:" + board.getAttachList());
		if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) { // 업데이트 되고 첨부파일이 있을 경우

			board.getAttachList().forEach(attach -> {	
				attach.setBrd_code(board.getBrd_code());
				attachMapper.insert(attach);
			});
		}

		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean delete(int brd_code) {				//게시글 삭제
		
		log.info("remove...." + brd_code);
		
		attachMapper.deleteAll(brd_code);

		return mapper.delete(brd_code) == 1;
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

	@Override
	public List<BoardAttachVO> getAttachList(int brd_code) {
		
		log.info("get Attach List by brd_code" + brd_code);
		
		return attachMapper.findByBrd_code(brd_code);
		
	}

	@Override
	public int brdViewCnt(int brd_code) {
		
		return mapper.views(brd_code);
	}

	@Override
	public void removeAttach(int brd_code) {

		log.info("remove all attach files");

		attachMapper.deleteAll(brd_code);
	}

}

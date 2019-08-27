package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.ReplyVO;
import org.fs.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		
		log.info("register... :" + vo);
		
		return mapper.insert(vo);
	
	}

	@Override
	public ReplyVO content(int rpl_code) {
		
		log.info("content .... :" + rpl_code );
		
		return mapper.read(rpl_code);
		
	}

	@Override
	public int modify(ReplyVO vo) {
		
		log.info("modify... : " + vo);
		
		return mapper.update(vo);
		
	}

	@Override
	public int remove(int rpl_code) {
		
		log.info("remove... : " + rpl_code);
		
		return mapper.delete(rpl_code);
		
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int brd_code) {
		
		log.info("get Reply List of a Board ... : "  + brd_code);
		
		return mapper.getListPaging(cri, brd_code);
		
	}

	
}

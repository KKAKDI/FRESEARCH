package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;
import org.fs.mapper.ResearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ResearchServiceImpl implements ResearchService{

	@Setter(onMethod_=@Autowired)
	private ResearchMapper mapper;
	
	/*
	@Override
	public List<ResearchVO> listStatus(ResearchVO vo){
		
		return mapper.listStatus(vo);
		
	}*/
	
	@Override
	public ResearchPageDTO list(Criteria cri) {
		return new ResearchPageDTO(
			mapper.list(cri));
	}
	
}

package org.fs.service;

import java.util.List;

import org.fs.domain.ResearchVO;
import org.fs.mapper.ResearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class ResearchServiceImpl implements ResearchService{

	@Setter(onMethod_=@Autowired)
	private ResearchMapper mapper;
	
	@Override
	public List<ResearchVO> listStatus(ResearchVO vo){
		
		return mapper.listStatus(vo);
		
	}
}

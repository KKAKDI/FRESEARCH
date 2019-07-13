package org.fs.service;

import java.util.List;

import org.fs.domain.StatsVO;
import org.fs.mapper.StatsMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StatsServiceImpl implements StatsService{
	private StatsMapper mapper;
	
	
	@Override
	public List<StatsVO> getList() {
		
		log.info("getList..........");
		
		return mapper.getList();
		
	}
	
	
	

}

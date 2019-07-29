package org.fs.service;

import java.util.List;
import java.util.Map;

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
	
	
	@Override	//통계 전체 리스트 구하는 메소드
	public List<StatsVO> getList() {
		
		log.info("getList..........");
		
		return mapper.getList();
	}
	@Override	//카테고리별  지역 기준 갯수 구하는 메소드
	public List<StatsVO> getCategory(String area){
		log.info("getCategory()...............");
		return mapper.getCategory(area);
	}
	@Override	//카테고리별 나이 기준 갯수 구하는 메소드
	public List<StatsVO> getCategoryAge(int startAge, int endAge){
		log.info("getCategory()...............");
		return mapper.getCategoryAge(startAge, endAge);
	}
	@Override	//카테고리별 나이 기준 갯수 구하는 메소드
	public List<StatsVO> getCategorySex(String sex){
		log.info("getCategory()...............");
		return mapper.getCategorySex(sex);
	}
	@Override	//카테고리별 나이 기준 갯수 구하는 메소드
	public List<StatsVO> getCategoryMarriage(String marriage){
		log.info("getCategory()...............");
		return mapper.getCategoryMarriage(marriage);
	}
	
	@Override	//멤버 리스트 구하는 메소드
	public List<StatsVO> getMemberList(){
		log.info("getMemberList...........");
		return mapper.getMemberList();
	}
	
	@Override		//선호 카테고리에서 전체 뽑지만 주로 기혼 미혼 구하는데 쓰임
	public List<StatsVO> getAttCategory(){
		log.info("getAttCategory...........");
		return mapper.getAttCategory();
	}
	@Override	//나이 구하는 메소드
	public List<StatsVO> getAge(){
		log.info("getAge............");
		return mapper.getAge();
	}
	@Override		//주소 구하는 메소드
	public int getAddr(String addr) {
		log.info("getAddr.............");
		return mapper.getAddr(addr);
	}
	@Override
	public List<StatsVO> getTable(StatsVO vo){
		log.info("getAddr.............");
		return mapper.getTable(vo);
	};
}

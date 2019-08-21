package org.fs.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.fs.domain.Criteria;
import org.fs.domain.StatsPagingSearchDTO;
import org.fs.domain.StatsVO;

public interface StatsService {
	public List<StatsVO> getList();
	public List<StatsVO> getMemberList();
	public List<StatsVO> getAttCategory();
	public List<StatsVO> getAge();
	public int getAddr(String addr);
	public List<StatsVO> getCategory(String area);
	public List<StatsVO> getCategoryAge(int StartAge, int EndAge);
	public List<StatsVO> getCategorySex(String sex);
	public List<StatsVO> getCategoryMarriage(String marriage);
	public List<StatsVO> getTable(StatsVO vo);
	public List<StatsVO> getTableTest(StatsVO vo, Criteria cri);
	public StatsPagingSearchDTO getTableAll(StatsVO vo, Criteria cri);
	public StatsPagingSearchDTO getTableSearch(StatsVO vo, Criteria cri);
	public List<StatsVO> getStatsContent(String subj_code);
	public List<StatsVO> header();
	public String headerCount();
}

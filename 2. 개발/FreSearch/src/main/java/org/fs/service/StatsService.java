package org.fs.service;

import java.util.List;
import java.util.Map;

import org.fs.domain.StatsAreaVO;
import org.fs.domain.StatsResultVO;
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
	
}

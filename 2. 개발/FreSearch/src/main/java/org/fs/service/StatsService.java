package org.fs.service;

import java.util.List;

import org.fs.domain.StatsAreaVO;
import org.fs.domain.StatsVO;

public interface StatsService {
	public List<StatsVO> getList();
	public List<StatsVO> getMemberList();
	public List<StatsVO> getAttCategory();
	public List<StatsVO> getAge();
	public int getAddr(String addr);
	public List<StatsAreaVO> getCategory(String area);
	public List<StatsAreaVO> getCategoryAge(int StartAge, int EndAge);
	public List<StatsAreaVO> getCategorySex(String sex);
	public List<StatsAreaVO> getCategoryMarriage(String marriage);
}

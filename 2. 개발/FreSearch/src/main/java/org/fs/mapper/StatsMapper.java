package org.fs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.fs.domain.StatsVO;


public interface StatsMapper {
	public List<StatsVO> getList();
	
	public List<StatsVO> getMemberList();
	
	public List<StatsVO> getAttCategory();
	
	public List<StatsVO> getAge();

}

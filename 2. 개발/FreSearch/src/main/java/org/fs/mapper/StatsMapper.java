package org.fs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.fs.domain.StatsVO;


public interface StatsMapper {
	public List<StatsVO> getList();
	
	public List<StatsVO> getMemberList();
	
	public List<StatsVO> getAttCategory();
	
	public List<StatsVO> getAge();
	
	public int getAddr(String addr);
	
	public List<StatsVO> getCategory(String area);
	
	public List<StatsVO> getCategoryAge(@Param("startAge")int startAge,@Param("endAge") int endAge);
	
	public List<StatsVO> getCategorySex(String sex);
	
	public List<StatsVO> getCategoryMarriage(String marriage);
	
	public List<StatsVO> getTable(StatsVO vo);

}

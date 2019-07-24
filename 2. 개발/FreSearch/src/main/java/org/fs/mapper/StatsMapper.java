package org.fs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.fs.domain.StatsAreaVO;
import org.fs.domain.StatsVO;


public interface StatsMapper {
	public List<StatsVO> getList();
	
	public List<StatsVO> getMemberList();
	
	public List<StatsVO> getAttCategory();
	
	public List<StatsVO> getAge();
	
	public int getAddr(String addr);
	
	public List<StatsAreaVO> getCategory(String area);
	
	public List<StatsAreaVO> getCategoryAge(@Param("startAge")int startAge,@Param("endAge") int endAge);
	
	public List<StatsAreaVO> getCategorySex(String sex);
	
	public List<StatsAreaVO> getCategoryMarriage(String marriage);

}

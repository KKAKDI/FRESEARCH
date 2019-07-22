package org.fs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.fs.domain.NewsVO;

public interface NewsMapper {
	
	//@Select("select * from NEWS where NEWS_CODE > 0")
	public List<NewsVO> getList();
	
	public void insert(NewsVO news);
	
	public void insertSelectKey(NewsVO news);
	
	public NewsVO read(int news_code);
	
	public int delete(int news_code);
	
	public int update(NewsVO news);
}

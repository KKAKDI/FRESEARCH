package org.fs.mapper;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.NewsAttachVO;
import org.fs.domain.NewsVO;

public interface NewsMapper {
	
	//@Select("select * from NEWS where NEWS_CODE > 0")
	public List<NewsVO> getList();
	
	public List<NewsVO> getListWithPaging(Criteria cri);
	
	public List<NewsVO> getListWithPagingEvent(Criteria cri);
	
	public void insert(NewsVO news);
	
	public Integer insertSelectKey(NewsVO news);
	
	public NewsVO read(int news_code);
	
	public int delete(int news_code);
	
	public int update(NewsVO news);
	
	public int getTotalCount(Criteria cri);
	
	public int getTotalCountEvent(Criteria cri);
	
	public List<NewsAttachVO> findByNews_code(int news_code);
	
	public int views(int news_code);
}

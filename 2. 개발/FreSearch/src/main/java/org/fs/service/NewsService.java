package org.fs.service;

import java.util.List;

import org.fs.domain.NewsAttachVO;
import org.fs.domain.NewsVO;

public interface NewsService {
	public void register(NewsVO news);
	
	public NewsVO get(int news_code);
	
	public int modify(NewsVO news);
	
	public boolean remove(int news_code);
	
	public List<NewsVO> getList();
	
	public List<NewsAttachVO> getAttachList(int news_code); // 첨부파일 목록 가져오기
}

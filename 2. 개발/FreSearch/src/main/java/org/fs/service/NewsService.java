package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.NewsAttachVO;
import org.fs.domain.NewsVO;

public interface NewsService {
	public void register(NewsVO news);
	
	public NewsVO get(int news_code);
	
	public boolean modify(NewsVO news);
	
	public boolean remove(int news_code);
	
	public List<NewsVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public List<NewsAttachVO> getAttachList(int news_code); // 첨부파일 목록 가져오기
	
	public void removeAttach(int news_code); // 첨부파일 삭제
	
	public NewsVO modifyGet(int news_code);
	
	// public void views(String param);
	
	public int newsViewCnt(int news_code); // 조회수 추가

}

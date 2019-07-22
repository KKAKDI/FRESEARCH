package org.fs.mapper;

import java.util.List;

import org.fs.domain.NewsAttachVO;

public interface NewsAttachMapper {

	public void insert(NewsAttachVO vo);
	
	public void delete(String news_attach_uuid);
	
	public List<NewsAttachVO> findByNews_code(int news_code);
}

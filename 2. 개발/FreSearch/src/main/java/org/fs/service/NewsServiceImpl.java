package org.fs.service;

import java.util.List;

import org.fs.domain.NewsAttachVO;
import org.fs.domain.NewsVO;
import org.fs.mapper.NewsAttachMapper;
import org.fs.mapper.NewsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NewsServiceImpl implements NewsService {
	
	//spring 4.3 이상에서 자동 처리
	//@Setter(onMethod_ = @Autowired)
	private NewsMapper mapper;
	private NewsAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(NewsVO news) {
		
		log.info("register......" + news);
		
		mapper.insertSelectKey(news);
		
		if(news.getAttachList() == null || news.getAttachList().size() <= 0) {
			return;
		}
		news.getAttachList().forEach(attach ->{
			attach.setNews_code(news.getNews_code());
			attachMapper.insert(attach);
		});
		
	}

	@Override
	public NewsVO get(int news_code) {
		log.info("get......" + news_code);
		
		return mapper.read(news_code);
	}

	@Override
	public int modify(NewsVO news) {
		log.info("modify......" + news);
		
		return mapper.update(news);
	}

	@Override
	public boolean remove(int news_code) {
		log.info("remove...." + news_code);
		
		return mapper.delete(news_code) == 1;
	}

	@Override
	public List<NewsVO> getList() {
		
		log.info("getList......");
		
		return mapper.getList();
	}

	@Override
	public List<NewsAttachVO> getAttachList(int news_code) {
		log.info("get Attach list by news_code" + news_code);
		
		return attachMapper.findByNews_code(news_code);
		
	}
	
}

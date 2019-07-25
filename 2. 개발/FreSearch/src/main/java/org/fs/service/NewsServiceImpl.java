package org.fs.service;

import java.util.List;

import org.fs.domain.Criteria;
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
	public void register(NewsVO news) { // 새글 등록하기
		
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
	@Transactional
	@Override
	public boolean modify(NewsVO news) { 
		log.info("modify......" + news);

		attachMapper.deleteAll(news.getNews_code());

		boolean modifyResult = mapper.update(news) == 1;
		
		if (modifyResult && news.getAttachList().size() > 0) {

			news.getAttachList().forEach(attach -> {

				attach.setNews_code(news.getNews_code());
				attachMapper.insert(attach);
			});
		}

		return modifyResult;
	}
	@Transactional // 삭제 시 첨부파일 같이 삭제
	@Override
	public boolean remove(int news_code) {
		log.info("remove...." + news_code);
		
		attachMapper.deleteAll(news_code);
		
		return mapper.delete(news_code) == 1;
	}

	@Override
	public List<NewsVO> getList(Criteria cri) {	// Content
		
		log.info("getList......");
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) { // 페이징
	
		log.info("get totalCount");
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<NewsAttachVO> getAttachList(int news_code) { // 첨부파일 리스트
		log.info("get Attach list by news_code" + news_code);
		
		return attachMapper.findByNews_code(news_code);	
	}
	
	
	
	@Override
	public void removeAttach(int news_code) {

		log.info("remove all attach files");

		attachMapper.deleteAll(news_code);
	}
	

}

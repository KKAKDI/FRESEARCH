package org.fs.controller;

import java.util.List;

import org.fs.domain.NewsAttachVO;
import org.fs.domain.NewsVO;
import org.fs.service.NewsService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/news/*")
@AllArgsConstructor
public class NewsController {
	
	private NewsService service;
	
	@GetMapping("/news_list") // 게시글 전체 목록
	public void list(Model model) {
		
		log.info("news_list");
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/news_register") // 게시물 등록
	public String register(NewsVO news, RedirectAttributes rttr) {
		
		log.info("=========================");
		
		log.info("register: " + news);
		
		if(news.getAttachList() != null) {
			
			news.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("=========================");

		service.register(news);
		
		rttr.addFlashAttribute("result", news.getNews_code());
		
		return "redirect:/news/news_list";
	}
	
	@GetMapping("/news_register") // 등록 페이지 이동
	public void register() {
		
	}
	
	@PostMapping("/news_modify") // 게시글 수정(관리자만)
	public @ResponseBody int modify(NewsVO news, RedirectAttributes rttr) {
		log.info("modify:" + news);
		
		/*
		 * if(service.modify(news)) { rttr.addFlashAttribute("result", "success"); }
		 */
		
		return service.modify(news);
	}

	@GetMapping({"/news_get", "/news_modify"}) // 특정 게시물 가져보기
	public void get(@RequestParam("news_code") int news_code, Model model) {
		
		log.info("/news_get or modify");
		
		model.addAttribute("news", service.get(news_code));
	}
	
	@PostMapping("/news_remove") // 게시글 삭제
	public @ResponseBody boolean remove(@RequestParam("news_code") int news_code, RedirectAttributes rttr) {
		log.info("remove..." + news_code);
		
//		if(service.remove(news_code)) {
//			rttr.addFlashAttribute("result", "success");
//		}
		return service.remove(news_code);
	}
	
	@GetMapping(value = "/getAttachList",
		    produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
@ResponseBody
public ResponseEntity<List<NewsAttachVO>> getAttachList(int news_code) {

	log.info("getAttachList " + news_code);

	return new ResponseEntity<>(service.getAttachList(news_code), HttpStatus.OK);

}
	
}

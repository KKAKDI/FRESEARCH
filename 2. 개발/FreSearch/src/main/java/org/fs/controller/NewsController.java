package org.fs.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.NewsAttachVO;
import org.fs.domain.NewsVO;
import org.fs.domain.PageDTO;
import org.fs.service.NewsService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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


	@GetMapping("/news_register") // 등록 페이지 이동
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	@GetMapping("/news_list") // 게시글  공지 목록
	public void list(Criteria cri, Model model) {
		log.info("news_list" + cri);

		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total" + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/news_list_event") // 게시글 이벤트 목록
	public void listEvent(Criteria cri, Model model) {
		log.info("news_listEvent" + cri);

		model.addAttribute("list", service.getListEvent(cri));

		int total = service.getTotalEvent(cri);

		log.info("total" + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/news_register") // 게시물 등록
	@PreAuthorize("isAuthenticated()")
	public String register(NewsVO news, RedirectAttributes rttr) {

		log.info("=========================");

		log.info("register: " + news);
		log.info("겟어태치:" + news.getAttachList());
		if(news.getAttachList() != null) { //파일 유무에 따라 파일첨부 컬럼 셋팅

			news.getAttachList().forEach(attach -> log.info(attach));	
			news.setNews_is_attach("Y");
		} else {
			news.setNews_is_attach("N");
		}

		log.info("=========================");

		service.register(news);

		rttr.addFlashAttribute("result", news.getNews_code());

		log.info("news.getNews_division() :" + news.getNews_division());
		if (news.getNews_division().equals("공지")) {
			return "redirect:/news/news_list";
		} else {
			return "redirect:/news/news_list_event";
		}
	}

	@GetMapping({"/news_get"}) // 특정 게시물 가져보기
	public void get(@RequestParam("news_code") int news_code, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/news_get");

		model.addAttribute("news", service.get(news_code));
	}

	@GetMapping({"/news_modify"}) // 특정 게시물 가져보기
	@PreAuthorize("isAuthenticated()")
	public void modifyGet(@RequestParam("news_code") int news_code, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/news_modify");

		model.addAttribute("news", service.modifyGet(news_code));
	}


	@PostMapping("/news_modify") // 게시글 수정(관리자만)
	@PreAuthorize("isAuthenticated()")
	public String modify(NewsVO news, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + news);

		if(news.getAttachList() != null) { //파일 유무에 따라 파일첨부 컬럼 셋팅

			news.getAttachList().forEach(attach -> log.info(attach));	
			news.setNews_is_attach("Y");
		} else {
			news.setNews_is_attach("N");
		}

		if (service.modify(news)) {

			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());


		if (news.getNews_division().equals("공지")) {
			return "redirect:/news/news_list";
		} else {
			return "redirect:/news/news_list_event";
		}
	}



	@PostMapping("/news_remove") // 게시글 삭제
	@PreAuthorize("isAuthenticated()")
	public String remove(@RequestParam("news_code") int news_code, Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + news_code);

		List<NewsAttachVO> attachList = service.getAttachList(news_code);

		if(service.remove(news_code)) {
			//delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}

		log.info("/news/news_list" + cri.getListLink());

		return "redirect:/news/news_list" + cri.getListLink();
	}

	// 파일 삭제 처리
	private void deleteFiles(List<NewsAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach file..........");
		log.info("attachList");

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:/upload/"+attach.getNews_attach_path()+"/"+attach.getNews_attach_uuid()+"_"+attach.getNews_attach_name());

				Files.deleteIfExists(file);

				if(Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:/upload/"+attach.getNews_attach_path()+"/s_"+attach.getNews_attach_uuid()+"_"+attach.getNews_attach_name());

					Files.delete(thumbNail);
				}

			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			} //end cath
		});//end foreach
	}

	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NewsAttachVO>> getAttachList(int news_code) {

		log.info("getAttachList " + news_code);

		return new ResponseEntity<>(service.getAttachList(news_code), HttpStatus.OK);

	}

	@RequestMapping(value="newsViewCnt" , method = RequestMethod.POST)  // 조회수 추가
	public @ResponseBody int newsViewCnt(int news_code)  {

		return service.newsViewCnt(news_code);
	}
}

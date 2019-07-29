package org.fs.controller;

import org.fs.domain.BoardVO; 
import org.fs.domain.Criteria;
import org.fs.domain.PageDTO;

import org.fs.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("board_list")						//리스트 보여주기
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);
		
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total" + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("board_register")
	public void register() {
		
	}
	
	@PostMapping("board_register")				//게시글 등록
	public String register(BoardVO board, RedirectAttributes ra) {
		log.info("register: " + board);
		service.register(board);
		ra.addFlashAttribute("result", board.getBrd_code());
		
		return "redirect:/board/board_list";
		
	}
	
	@GetMapping({"/board_content", "/board_modify"}) //게시글 보기
	public void content(@RequestParam("brd_code") int brd_code, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/board_content or board_modify");
		model.addAttribute("board", service.content(brd_code));	
	}
	
	@PostMapping("/board_modify")				//게시글 수정
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes ra) {
		log.info("modify :" + board);
		
		if(service.modify(board)) {
			ra.addFlashAttribute("result", "success");
		}	
		return "redirect:/board/board_list" + cri.getListLink();
	}
	
	@PostMapping("/board_delete")				//게시글 삭제
	public String delete(@RequestParam("brd_code") int brd_code ,@ModelAttribute("cri") Criteria cri, RedirectAttributes ra) {
		
		log.info("remove : " + brd_code);
		if(service.delete(brd_code)) {
			ra.addAttribute("result" , "success");
		}
		return "redirect:/board/board_list" + cri.getListLink();
	}
	
	
	

}

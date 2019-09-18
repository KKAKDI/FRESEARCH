package org.fs.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.fs.domain.BoardAttachVO;
import org.fs.domain.BoardVO; 
import org.fs.domain.Criteria;
import org.fs.domain.PageDTO;
import org.fs.service.BoardService;
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
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@GetMapping("/board_list")						//리스트 보여주기
	public void list(Criteria cri, Model model) {
		log.info("list" + cri);

		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total" + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/board_register")
	@PreAuthorize("isAuthenticated()")
	public void register() {

	}

	@PostMapping("/board_register")				//게시글 등록
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes ra) {

		log.info("=========================");

		log.info("register: " + board);

		if(board.getAttachList() != null) {
			log.info("들어오니? ");
			board.getAttachList().forEach(attach -> log.info(attach));

			board.setBrd_is_attach("Y");

		}else {
			log.info("들어오니? 1111111111111");
			board.setBrd_is_attach("N");

		}

		log.info("=========================");

		service.register(board);

		ra.addFlashAttribute("result", board.getBrd_code());

		return "redirect:/board/board_list";

	}

	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int brd_code) {

		log.info("getAttachList " + brd_code);

		return new ResponseEntity<>(service.getAttachList(brd_code), HttpStatus.OK);

	}

	@GetMapping("/board_content") //게시글 보기
	public void content(@RequestParam("brd_code") int brd_code, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/board_content");
		model.addAttribute("board", service.content(brd_code));	
	}

	@GetMapping("/board_modify") //게시글 보기
	@PreAuthorize("isAuthenticated()")
	public void modifyForm(@RequestParam("brd_code") int brd_code, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/board_modify");
		model.addAttribute("board", service.content(brd_code));	
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/board_modify")				//게시글 수정
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes ra) {
		log.info("modify :" + board);

		if(board.getAttachList() != null) {

			board.getAttachList().forEach(attach -> log.info(attach));

			board.setBrd_is_attach("Y");

		}else {
			board.setBrd_is_attach("N");
		}
		if(service.modify(board)) {
			ra.addFlashAttribute("result", "success");
		}	
		return "redirect:/board/board_list" + cri.getListLink();
	}

	@PreAuthorize("principal.username == #mb_email")
	@PostMapping("/board_delete")				//게시글 삭제
	public String delete(@RequestParam("brd_code") int brd_code ,@ModelAttribute("cri") Criteria cri, RedirectAttributes ra, String mb_email) {

		log.info("remove : " + brd_code);

		List<BoardAttachVO> attachList = service.getAttachList(brd_code);

		if(service.delete(brd_code)) {

			deleteFiles(attachList);

			ra.addAttribute("result" , "success");
		}
		return "redirect:/board/board_list" + cri.getListLink();
	}

	@RequestMapping(value="brdViewCnt", method=RequestMethod.POST)		//조회수 증가
	public @ResponseBody int brdViewCnt(int brd_code) {
		log.info("##########");
		return service.brdViewCnt(brd_code);

	}

	// 파일 삭제 처리
	private void deleteFiles(List<BoardAttachVO> attachList) {

		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach file..........");
		log.info("attachList");

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:/upload/"+attach.getBrd_attach_path()+"/"+attach.getBrd_attach_uuid()+"_"+attach.getBrd_attach_name());

				Files.deleteIfExists(file);

				if(Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("C:/upload/"+attach.getBrd_attach_path()+"/s_"+attach.getBrd_attach_uuid()+"_"+attach.getBrd_attach_name());

					Files.delete(thumbNail);
				}

			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			} //end cath

		});//end foreach
	}
}

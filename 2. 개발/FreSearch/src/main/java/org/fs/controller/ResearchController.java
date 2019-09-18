package org.fs.controller;

import java.util.List;

import org.fs.domain.Criteria;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;
import org.fs.service.ResearchService;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/research/*")
@AllArgsConstructor
@Log4j
public class ResearchController {
	private ResearchService service;

	//설문 목록 페이지
	@GetMapping("research_list")
	public void list() {}

	//설문 목폭 페이지 진행,종료 탭별 페이징 처리
	@GetMapping(value = "/pages/{research}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ResearchPageDTO> list(
			@PathVariable("page") int page,
			@PathVariable("research") String research){
		log.info("list.........");
		Criteria cri = new Criteria(page, 6);
		log.info(cri);

		return new ResponseEntity<>(service.list(cri, research), HttpStatus.OK);
	}

	//로그인 후 권한에 따른 설문 등록 페이지
	@GetMapping("research_register")
	@PreAuthorize("isAuthenticated()")
	public void regForm() {}

	//로그인 후 권한에 따른 설문 등록
	@PostMapping("research_register")
	@PreAuthorize("isAuthenticated()")
	public String reg(RedirectAttributes rttr,HttpServletRequest request) {
		String values = request.getParameter("research_values");
		log.info(values);
		service.researchReg(values);	
		return "redirect:/research/research_list";
	}
	
	//로그인 후 권한에 따른 설문 참여 페이지
	@GetMapping("research_content")
	@PreAuthorize("isAuthenticated()")
	public void content(@RequestParam("subj_code") String subj_code,Model model) {
		List<ResearchVO> content = service.researchContent(subj_code);
		model.addAttribute("content",content);
	}
	
	//로그인 후 권한에 따른 설문 참여
	@PostMapping("research_content")
	@PreAuthorize("isAuthenticated()")
	public String answer(RedirectAttributes rttr,HttpServletRequest request) {
		String values = request.getParameter("research_values");	
		String code = request.getParameter("research_code");
		service.researchAnswer(values);
		return "redirect:/stats/stats_get?subj_code="+code;
	}	
	
	//로그인 후 해당 설문 작성 유저일 경우 설문 삭제
	@GetMapping("research_delete")
	@PreAuthorize("isAuthenticated()")
	public String delete(RedirectAttributes rttr,HttpServletRequest request) {
		String subj_code = request.getParameter("subj_code");
		service.researchDelete(subj_code);
		return "redirect:/research/research_list";
	}	
}

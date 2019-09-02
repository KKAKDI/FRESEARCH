package org.fs.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.fs.domain.Criteria;
import org.fs.domain.MemberVO;
import org.fs.domain.PageDTO;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;
import org.fs.service.ResearchService;
import javax.servlet.http.HttpServletRequest;

//import org.fs.domain.ResearchVO;
//import org.fs.service.ResearchService;


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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/research/*")
@AllArgsConstructor
@Log4j
public class ResearchController {
	private ResearchService service;

	@GetMapping("research_list")
	public void list() {}
	
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
		if(research =="ingResearch") {
			research ="진행중설문";
		}else {
			research ="종료된설문";
		}
		return new ResponseEntity<>(service.list(cri, research), HttpStatus.OK);
	}
	/*
	@PostMapping(value = "/research_listTab", 
		consumes = "application/json",
	    produces = {
	          MediaType.APPLICATION_XML_VALUE,
	          MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public ResponseEntity<List<ResearchVO>> listStatus(@RequestBody ResearchVO vo){

		return new ResponseEntity<>(service.listStatus(vo), HttpStatus.OK);
	}*/

	@GetMapping("research_register")
	@PreAuthorize("isAuthenticated()")
	public void regForm() {	
	}

	
	@PostMapping("research_register")
	@PreAuthorize("isAuthenticated()")
	public String reg(RedirectAttributes rttr,HttpServletRequest request) {
		String values = request.getParameter("research_values");
		log.info(values);
		service.researchReg(values);	
		return "redirect:/research/research_list";
	}
	@GetMapping("research_content")
	@PreAuthorize("isAuthenticated()")
	public void content(@RequestParam("subj_code") String subj_code,Model model) {
		List<ResearchVO> content = service.researchContent(subj_code);
		model.addAttribute("content",content);
	}
	@PostMapping("research_content")
	@PreAuthorize("isAuthenticated()")
	public String answer(RedirectAttributes rttr,HttpServletRequest request) {
		String values = request.getParameter("research_values");	
		String code = request.getParameter("research_code");
		service.researchAnswer(values);
		return "redirect:/stats/stats_get?subj_code="+code;
	}	
	@GetMapping("research_delete")
	public String delete(RedirectAttributes rttr,HttpServletRequest request) {
		String subj_code = request.getParameter("subj_code");
		service.researchDelete(subj_code);
		return "redirect:/research/research_list";
	}	
}

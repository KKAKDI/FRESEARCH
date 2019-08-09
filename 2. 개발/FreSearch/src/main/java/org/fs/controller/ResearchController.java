package org.fs.controller;

import java.util.ArrayList;
import java.util.List;



import org.fs.domain.Criteria;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;


import org.springframework.web.bind.annotation.RequestParam;

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
	public void list() {
		
	}
	
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
	public void regForm() {	
	}

	
	@PostMapping("research_register")
	public void reg(RedirectAttributes rttr,HttpServletRequest request) {
		String values = request.getParameter("research_values");
		log.info(values);
		service.researchReg(values);		
	}
	@GetMapping("research_content")
	public void content(@RequestParam("subj_code") String subj_code,Model model) {
		List<ResearchVO> content = service.researchContent(subj_code);
		model.addAttribute("content",content);
	}
	@PostMapping("research_content")
	public void answer(RedirectAttributes rttr,HttpServletRequest request) {
		String values = request.getParameter("research_values");
		service.researchAnswer(values);
	}
}

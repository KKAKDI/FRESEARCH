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
	
	@GetMapping(value = "/pages/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ResearchPageDTO> list(
			@PathVariable("page") int page){
		log.info("list.........");
		Criteria cri = new Criteria(page, 6);
		log.info(cri);
		return new ResponseEntity<>(service.list(cri), HttpStatus.OK);
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
		
		ResearchVO vo = new ResearchVO();
		
		String[] block = values.split("/block");
		for(int i=0;i<block.length;i++) {
			log.info("block"+i+": "+block[i]);
			if(i==0) {
				String[] header = block[i].split("#h#");
				for(int j=0;j<header.length;j++) {
					log.info("header"+j+": "+header[j]);			
					//주제코드 이메일 닉네임 주제명 등록일 시작일 종료일
				}
			}else {
				String item[] = block[i].split("#t#");
				String [][] items = new String[block.length][item.length];
				for(int k=0;k<item.length;k++) {
					items[i][k]=item[k];
					log.info("item["+i+"]["+k+"]: "+items[i][k]);
					//item[i][k] i 0 = 질문 / i n 은 아이템
					//질문코드 1회 생성 아이템 마다 코드 생성
				}
			}			
		}
	}
}

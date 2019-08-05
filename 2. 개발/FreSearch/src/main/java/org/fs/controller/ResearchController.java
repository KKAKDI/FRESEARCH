package org.fs.controller;

import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD

import org.fs.domain.Criteria;
import org.fs.domain.PageDTO;
import org.fs.domain.ResearchPageDTO;
import org.fs.domain.ResearchVO;
import org.fs.service.ResearchService;
import javax.servlet.http.HttpServletRequest;

//import org.fs.domain.ResearchVO;
//import org.fs.service.ResearchService;

=======
import javax.servlet.http.HttpServletRequest;
>>>>>>> 08fd5bba7aab24ccb230be50b2525646846c9659
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
<<<<<<< HEAD

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
=======
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;
>>>>>>> 08fd5bba7aab24ccb230be50b2525646846c9659

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/research/*")
@AllArgsConstructor
@Log4j
public class ResearchController {
<<<<<<< HEAD
	
=======
>>>>>>> 08fd5bba7aab24ccb230be50b2525646846c9659
	private ResearchService service;
  
	@GetMapping("research_reg")
	public String regForm() {
	return "research/research_register";
  }	
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
<<<<<<< HEAD
	public ResponseEntity<List<ResearchVO>> listStatus(@RequestBody ResearchVO vo){

		return new ResponseEntity<>(service.listStatus(vo), HttpStatus.OK);
	}*/
	@GetMapping("research_register")
	public void regForm() {
=======
	public ResponseEntity<List<ResearchVO>> listStatus(@RequestBody ResearchVO vo){		
		return new ResponseEntity<>(service.listStatus(vo), HttpStatus.OK);
>>>>>>> 08fd5bba7aab24ccb230be50b2525646846c9659
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
					//�����ڵ� �̸��� �г��� ������ ����� ������ ������
				}
			}else {
				String item[] = block[i].split("#t#");
				String [][] items = new String[block.length][item.length];
				for(int k=0;k<item.length;k++) {
					items[i][k]=item[k];
					log.info("item["+i+"]["+k+"]: "+items[i][k]);
					//item[i][k] i 0 = ���� / i n �� ������
					//�����ڵ� 1ȸ ���� ������ ���� �ڵ� ����
				}
			}			
		}
	}
}

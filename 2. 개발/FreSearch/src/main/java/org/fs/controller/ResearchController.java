package org.fs.controller;

import java.util.List;

import org.fs.domain.ResearchVO;
import org.fs.service.ResearchService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/research/*")
@AllArgsConstructor
public class ResearchController {
	
	private ResearchService service;
	
	@GetMapping("research_list")
	public void list() {}
	
	@PostMapping(value = "/research_listTab", 
		consumes = "application/json",
	    produces = {
	          MediaType.APPLICATION_XML_VALUE,
	          MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public ResponseEntity<List<ResearchVO>> listStatus(@RequestBody ResearchVO vo){
	   return new ResponseEntity<>(service.listStatus(vo), HttpStatus.OK);
	}
	
	@GetMapping("research_register")
	public void regForm() {}
	
	@PostMapping("research_register")
	public void reg() {
		
	}
	
}

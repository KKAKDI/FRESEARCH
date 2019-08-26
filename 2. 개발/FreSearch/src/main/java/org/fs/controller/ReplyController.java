package org.fs.controller;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.fs.domain.Criteria;
import org.fs.domain.ReplyVO;
import org.fs.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})	//댓글 등록
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		
		log.info("ReplyVO : " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Reply insert Count -: " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		//삼항 연산자 처리
		
	@GetMapping(value = "/pages/{brd_code}/{page}", 
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})	//댓글 조회
	public ResponseEntity<List<ReplyVO>> getList(
		
		@PathVariable("page") int page,
		@PathVariable("brd_code") int brd_code){
		
		log.info("getList............");
		
		Criteria cri = new Criteria(page,10);
		
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, brd_code), HttpStatus.OK);
		
		}
	
	@GetMapping(value= "/{rpl_code}",
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> content(@PathVariable("rpl_code") int rpl_code){
		
		log.info("content: " + rpl_code);
		
		return new ResponseEntity<>(service.content(rpl_code), HttpStatus.OK);
		
	}
	
	@DeleteMapping(value="/{rpl_code}", produces = { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rpl_code") int rpl_code){
		
		log.info("remove: " + rpl_code);
		
		return service.remove(rpl_code) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value="/{rpl_code}", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rpl_code") int rpl_code){
		
		vo.setRpl_code(rpl_code);
		
		log.info("rpl_code .. : " + rpl_code);
		
		log.info("modify : "  + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success" , HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
}

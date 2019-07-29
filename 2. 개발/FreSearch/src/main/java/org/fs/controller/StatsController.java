package org.fs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.fs.domain.StatsAreaVO;
import org.fs.domain.StatsVO;
import org.fs.service.StatsService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stats")
@AllArgsConstructor
public class StatsController {
	private StatsService service;
	
	
	@GetMapping("/pages/index")
	public void list() {
		log.info("list: ");
	}
	@GetMapping("/stats_list")
	public void All(Model model) {
		int education = 0;
		int computer = 0;
		int game = 0;
		int entertainment = 0;
		int life =0;
		int heath = 0;
		int society = 0;
		int economy = 0;
		int travel = 0;
		int sports = 0;
		int shopping = 0;
		int region = 0;
		int marriage = 0;
		int boy = 0;
		int girl = 0;
		int unsingle = 0;
		int single =0 ;

		
		int ten = 0;
		int twenty = 0;
		int thiry = 0;
		int forty =0;
		int fifty = 0;
		int sixty = 0;
		
		
		//통계 ALL
		for( StatsVO temp : service.getList()) {
			if(temp.getCtgrCode().equals("A0000001")) {
				education++;
				
			}else if(temp.getCtgrCode().equals("B0000001")){
				computer++;
				
			}else if(temp.getCtgrCode().equals("C0000001")) {
				game ++;
			}else if(temp.getCtgrCode().equals("D0000001")) {
				entertainment++;
			}else if(temp.getCtgrCode().equals("E0000001")) {
				life++;
			}else if(temp.getCtgrCode().equals("F0000001")) {
				heath++;
			}else if(temp.getCtgrCode().equals("G0000001")) {
				society++;
			}else if(temp.getCtgrCode().equals("H0000001")) {
				economy++;
			}else if(temp.getCtgrCode().equals("I0000001")) {
				travel++;
			}else if(temp.getCtgrCode().equals("J0000001")) {
				sports++;
			}else if(temp.getCtgrCode().equals("K0000001")) {
				shopping++;
			}else if(temp.getCtgrCode().equals("L0000001")) {
				region++;
			}else if(temp.getCtgrCode().equals("M0000001")) {
				marriage++;
			}
		}
		
		//성별
		for(StatsVO temp : service.getMemberList()) {
			if(temp.getMbSex().equals("남")) {
				boy ++;
			}else if(temp.getMbSex().equals("여")) {
				girl++;
			}
		}
	
		
		
		//결혼 여부
		for(StatsVO temp : service.getAttCategory()) {
			if(temp.getMbMarriageYn().equals("기혼")) {
				unsingle ++;
			}else if(temp.getMbMarriageYn().equals("미혼")) {
				single++;
			}
		}
		
		
		//나이
		for (int i=0; i<service.getAge().size(); i++) {
			switch (service.getAge().get(i).getAge()/10) {
			case 1:
				ten ++;
				break;
			case 2:
				twenty++;
				break;
			case 3:
				thiry++;
				break;
			case 4:
				forty++;
				break;
			case 5:
				fifty++;
				break;
			case 6:
				sixty++;
				break;
			default:
				log.info("에러");
			}
		}
		
		
		//지역
		model.addAttribute("seoul", service.getAddr("서울"));
		model.addAttribute("gyeongGi", service.getAddr("경기"));
		model.addAttribute("busan", service.getAddr("부산"));
		model.addAttribute("incheon", service.getAddr("인천"));
		
		//나이
		model.addAttribute("sixty", sixty);
		model.addAttribute("fifty", fifty);
		model.addAttribute("forty", forty);
		model.addAttribute("thiry", thiry);
		model.addAttribute("twenty", twenty);
		model.addAttribute("ten", ten);
		
		
		//결혼 여부
		model.addAttribute("unsingle", unsingle);
		model.addAttribute("single", single);
		
		//성별
		model.addAttribute("girl", girl);
		model.addAttribute("boy", boy);
		
		//통계 ALL
		model.addAttribute("education", education);
		model.addAttribute("computer", computer);
		model.addAttribute("game", game);
		model.addAttribute("entertainment", entertainment);
		model.addAttribute("life", life);
		model.addAttribute("heath", heath);
		model.addAttribute("society", society);
		model.addAttribute("economy", economy);
		model.addAttribute("travel", travel);
		model.addAttribute("sports", sports);
		model.addAttribute("shopping", shopping);
		model.addAttribute("region", region);
		model.addAttribute("marriage", marriage);
		log.info("statsList");
	}
	@GetMapping("/stats_area") 
	public void area() {
		log.info("stats_area");

	}
	@GetMapping("/stats_age") 
	public void age() {
		log.info("stats_age");
	}
	@GetMapping("/stats_sex") 
	public void sex() {
		log.info("stats_sex");
	}
	@GetMapping("/stats_table") 
	public void table() {
		log.info("stats_table");
	}
	@GetMapping("/stats_marriage") 
	public void marriage() {
		log.info("stats_marriage");
	}

	@GetMapping(value = "/get/area/{area}" ,
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public ResponseEntity<List<StatsVO>> getCategory(@PathVariable("area") String area){
		log.info("조성식 get : "+area);
		if(area.contentEquals("전체")) {
			area = "";
		}

		return new ResponseEntity<>(service.getCategory(area), HttpStatus.OK);
	}
	@GetMapping(value = "/get/age/{age}" ,
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public ResponseEntity<List<StatsVO>> getCategoryAge(@PathVariable("age") String age){
		log.info("조성식 get : "+age);
		int startAge = 0;
		int endAge =0;
		if (age.equals("10대")) {
			startAge = 10;
			endAge =19;
			
		}else if(age.equals("20대")) {
			startAge = 20;
			endAge =29;
		}else if(age.equals("30대")) {
			startAge = 30;
			endAge =39;
		}else if(age.equals("40대")) {
			startAge = 40;
			endAge =49;
		}else if(age.equals("50대")) {
			startAge = 50;
			endAge =59;
		}else if(age.equals("60대")) {
			startAge = 60;
			endAge =69;
		}
		return new ResponseEntity<>(service.getCategoryAge(startAge, endAge), HttpStatus.OK);
	}
	
	@GetMapping(value = "/get/sex/{sex}" ,
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public ResponseEntity<List<StatsVO>> getCategorySex(@PathVariable("sex") String sex){
		log.info("조성식 get : "+sex);
		if(sex.equals("남자")) {
			sex = "남";
		}else if(sex.equals("여자")) {
			sex = "여";
		}
				return new ResponseEntity<>(service.getCategorySex(sex), HttpStatus.OK);
	}
	
	@GetMapping(value = "/get/marriage/{marriage}" ,
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public ResponseEntity<List<StatsVO>> getCategoryMarriage(@PathVariable("marriage") String marriage){
		log.info("조성식 get : "+marriage);
		
				return new ResponseEntity<>(service.getCategoryMarriage(marriage), HttpStatus.OK);
	}
	@GetMapping("../index")
	public void Sex() {
		log.info("Sex: ");
	}
	@GetMapping("../index_boot")
	public void Marriage() {
		log.info("Marriage: ");
	}
	
//	@GetMapping(value = "/get/table/{table}" ,
//			produces = {
//					MediaType.APPLICATION_XML_VALUE,
//					MediaType.APPLICATION_JSON_UTF8_VALUE}) 
//	public ResponseEntity<List<StatsVO>> getTable(@PathVariable("table") Map<String, String> table){
//		
//
//		
//		/*Map<String, String> table = new HashMap<String, String>();
//			table.put("ctgrNm", "교육");
//			table.put("mbSex", "남");
//			table.put("mbAddr", "서울");
//			table.put("startAge", "30");
//			table.put("endAge", "39");*/
//				return new ResponseEntity<>(service.getTable(table), HttpStatus.OK);
//	}
	@RequestMapping(method = {RequestMethod.POST, RequestMethod.PATCH},
			value = "/table",
			consumes = "application/json",
			produces = "application/json")
	public ResponseEntity <List<StatsVO>> getTable(@RequestBody StatsVO vo){
//		if(vo.getAge() == 30) {
//			vo.setStartAge(30);
//			vo.setEndAge(39);
//			System.out.println("여기에 들어왔다!!");
//		}
		log.info("왜 안찍히냐고");
		
		return new ResponseEntity<>(service.getTable(vo),HttpStatus.OK);
	}
}

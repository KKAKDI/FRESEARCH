package org.fs.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void Age(Model model) {
		log.info("All: ");
		model.addAttribute("list", service.getList());
	}
	@GetMapping("/stats_area1") 
	public void Age1(Model model) {
		log.info("All: ");
		model.addAttribute("list", service.getList());
	}

	@GetMapping(value = "/get/{area}" ,
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE}) 
	public ResponseEntity<List<StatsAreaVO>> getCategory(@PathVariable("area") String area){
		log.info("조성식 get : "+area);
		if(area.contentEquals("전체")) {
			area = "";
		}

		return new ResponseEntity<>(service.getCategory(area), HttpStatus.OK);
	}
	@GetMapping("../index")
	public void Sex() {
		log.info("Sex: ");
	}
	@GetMapping("../index_boot")
	public void Marriage() {
		log.info("Marriage: ");
	}
}

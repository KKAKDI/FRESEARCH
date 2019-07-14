package org.fs.controller;

import org.fs.domain.StatsVO;
import org.fs.service.StatsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		int seoul =0;
		int incheon =0;
		int busan = 0;
		int gyeongGi =0;
		int sdfsdf =0;
		
		int ten = 0;
		int twenty = 0;
		int thiry = 0;
		int forty =0;
		int fifty = 0;
		int sixty = 0;
		
		
		
		for( StatsVO temp : service.getList()) {
			if(temp.getCtgrCode().equals("B0000001")) {
				education++;
				
			}else if(temp.getCtgrCode().equals("B0000002")){
				computer++;
				
			}else if(temp.getCtgrCode().equals("B0000003")) {
				game ++;
			}else if(temp.getCtgrCode().equals("B0000004")) {
				entertainment++;
			}else if(temp.getCtgrCode().equals("B0000005")) {
				life++;
			}else if(temp.getCtgrCode().equals("B0000006")) {
				heath++;
			}else if(temp.getCtgrCode().equals("B0000007")) {
				society++;
			}else if(temp.getCtgrCode().equals("B0000008")) {
				economy++;
			}else if(temp.getCtgrCode().equals("B0000009")) {
				travel++;
			}else if(temp.getCtgrCode().equals("B0000010")) {
				sports++;
			}else if(temp.getCtgrCode().equals("B0000011")) {
				shopping++;
			}else if(temp.getCtgrCode().equals("B0000012")) {
				region++;
			}else if(temp.getCtgrCode().equals("B0000013")) {
				marriage++;
			}
		}
		for(StatsVO temp : service.getMemberList()) {
			if(temp.getMbSex().equals("남")) {
				boy ++;
			}else if(temp.getMbSex().equals("여")) {
				girl++;
			}
		}
		for(StatsVO temp : service.getMemberList()) {
			if(temp.getMbAddr().equals("서울")) {
				seoul++;
			}else if(temp.getMbAddr().equals("부산")) {
				busan++;
			}else if(temp.getMbAddr().equals("인천")) {
				incheon++;
			}else if(temp.getMbAddr().equals("경기")) {
				gyeongGi++;
			}
		}
		
		for(StatsVO temp : service.getAttCategory()) {
			if(temp.getMbMarriageYn().equals("기혼")) {
				unsingle ++;
			}else if(temp.getMbMarriageYn().equals("미혼")) {
				single++;
			}
		}
		
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
		
		model.addAttribute("sixty", sixty);
		model.addAttribute("fifty", fifty);
		model.addAttribute("forty", forty);
		model.addAttribute("thiry", thiry);
		model.addAttribute("twenty", twenty);
		model.addAttribute("ten", ten);
		
		
		model.addAttribute("seoul", seoul);
		model.addAttribute("busan", busan);
		model.addAttribute("incheon", incheon);
		model.addAttribute("gyeongGi", gyeongGi);
		model.addAttribute("unsingle", unsingle);
		model.addAttribute("single", single);
		model.addAttribute("girl", girl);
		model.addAttribute("boy", boy);
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
	@GetMapping("/Test")
	public void Area(Model model) {
		
		log.info("statsList");
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

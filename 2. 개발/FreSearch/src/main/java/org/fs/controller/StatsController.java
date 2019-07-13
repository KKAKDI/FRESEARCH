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
		int CtgrCode = 0;
		for( StatsVO temp : service.getList()) {
			if(temp.getCtgrCode().equals("B0000001")) {
				CtgrCode++;
				
			}
			log.info("조성식 : "+CtgrCode);
		}
		log.info("All: ");
		model.addAttribute("education", CtgrCode);
		model.addAttribute("list", service.getList());
	}
	@GetMapping("/stats_area") 
	public void Age(Model model) {
		log.info("All: ");
		model.addAttribute("list", service.getList());
	}
	@GetMapping("/Test")
	public void Area(Model model) {
		int CtgrCode = 0;
		for( StatsVO temp : service.getList()) {
			if(temp.getCtgrCode().equals("B0000001")) {
				CtgrCode++;
				
			}
			log.info("조성식 : "+CtgrCode);
		}
		
		model.addAttribute("education", CtgrCode);
		model.addAttribute("list", service.getList());
		log.info("Area: ");
	}
	@GetMapping("/charts/Sex")
	public void Sex() {
		log.info("Sex: ");
	}
	@GetMapping("/charts/Marriage")
	public void Marriage() {
		log.info("Marriage: ");
	}
}

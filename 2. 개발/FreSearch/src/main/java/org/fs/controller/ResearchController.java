package org.fs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/research")
public class ResearchController {
	@RequestMapping("/research_list")
	public String list() {
		return "research/research_list";
	}
	@RequestMapping("/research_reg")
	public String reg() {
		return "research/research_register";
	}
}

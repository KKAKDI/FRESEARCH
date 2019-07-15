package org.fs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/research")
public class ResearchController {
	@RequestMapping("/list.do")
	public String list() {
		return "research/research_list";
	}
}

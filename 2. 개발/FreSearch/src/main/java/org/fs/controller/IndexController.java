package org.fs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class IndexController {
	@RequestMapping("")
	public String index() {
		return "index";
	}
}

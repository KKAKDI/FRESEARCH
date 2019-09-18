package org.fs.controller;

import java.security.Principal;

import org.fs.domain.ApplyVO;
import org.fs.domain.Criteria;
import org.fs.domain.PageDTO;
import org.fs.service.ApplyService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/apply/*")
@AllArgsConstructor
public class ApplyController {

	private ApplyService service;

	@GetMapping("/apply")
	public void applyMove() {

	}

	@PostMapping("/apply")
	public @ResponseBody String apply(ApplyVO apply, Principal principal) { // ,HttpSession session 추가 
		//boolean registedChk = false;
		String mb_email = principal.getName();

		if(service.atrtChk(mb_email) != null) {
			return "already panel";
		} else {
			if(service.applyChk(mb_email) == null) {
				apply.setMb_email(mb_email);
				service.regist(apply);
				return "ok";
			}else {
				return "already apply";
			}
		}
	}

	@GetMapping("/approval_list") // 승인게시판
	public void list(Criteria cri, Model model) {
		log.info("approval_list" + cri);

		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total" + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/approval")
	public @ResponseBody boolean approval(@RequestParam("mb_email") String mb_email) {

		log.info("mb_email" + mb_email);

		return service.approval(mb_email);
	}		
}

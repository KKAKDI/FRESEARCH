package org.fs.controller;

import javax.servlet.http.HttpSession;

import org.fs.domain.ApplyVO;
import org.fs.domain.Criteria;
import org.fs.domain.PageDTO;
import org.fs.service.ApplyService;
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
	
	/*
	@GetMapping("/approval")
	public void approvalMove() {
		
	}
	*/
	
	/*
	@GetMapping("/apply") // 신청게시판 로그인 체크 후 이동
	public String applyMove(HttpSession session) {
		String userId = (String)session.getAttribute("mb_email");
		if(userId ==  null) {
			//return "redirect:/news/news_register";
			return "redirect:/apply/applyMove";
		}
		
		return "redirect:/apply/apply";
		
		//세션체크해서 안되어 있으면 로그인 페이지 이동
		
	}
	*/
	
	@PostMapping("/apply")
	public @ResponseBody boolean apply(ApplyVO apply, HttpSession session) { // ,HttpSession session 추가 
		boolean registedChk = false;
		//String mb_email = (String) session.getAttribute("mb_email");
		if(service.applyChk("abc@naver.com") != null) {
			registedChk = true;
		} else {
			registedChk = false;
		}
		
		log.info("#####registedChk :" + registedChk);
		/*
		if(service.applyChk(mb_email) == true) { // 이미 신청된경우 신청 안됨
			registStatus = "already registed";
			
			
		} else {
			service.regist(mb_email);
			registStatus = "regist OK";
			//apply.setNews_is_attach("N");
		}
		*/
		
		if (registedChk == true) {
			return false;
			//// return registedChk;
		} else {
			apply.setMb_email("abc@naver.com");
			if(true) { // 이미 신청된경우 신청 안됨
				service.regist(apply);
				return true;
				//apply.setNews_is_attach("N");

			}
		}
			//service.regist();
			//
		//}
		return false;

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

		//if(service.approval(mb_email) == false) {
		//	return ;
		//} else {
		
			return service.approval(mb_email);
		//}
	}		
	

}

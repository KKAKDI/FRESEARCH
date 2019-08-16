package org.fs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.fs.domain.MemberVO;
import org.fs.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
public class MemberController {
	
	private MemberService service;
	
	@GetMapping("/signup")
	public void signUpForm() {}
	
	@PostMapping("/signup")
	public String signUp(MemberVO member, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("signup: " + member);
		String mb_att_category = request.getParameter("mb_att_category");
		log.info("mb_att_category : " + mb_att_category);
		String[] array = mb_att_category.split(",");
		for(int i=0; i<array.length; i++) {
			if(array[i] == array[0]) {
				String ctgr_code1 = array[0];
				log.info("ctgr_code1 : " + ctgr_code1);
				member.setCtgr_code1(ctgr_code1);
			}else if(array[i] == array[1]) {
				String ctgr_code2 = array[1];
				log.info("ctgr_code2 : " + ctgr_code2);
				member.setCtgr_code2(ctgr_code2);
			}else if(array[i] == array[2]) {
				String ctgr_code3 = array[2];
				log.info("ctgr_code3 : " + ctgr_code3);
				member.setCtgr_code3(ctgr_code3);
			}else if(array[i] == array[3]) {
				String ctgr_code4 = array[3];
				log.info("ctgr_code4 : " + ctgr_code4);
				member.setCtgr_code4(ctgr_code4);
			}else if(array[i] == array[4]) {
				String ctgr_code5 = array[4];
				log.info("ctgr_code5 : " + ctgr_code5);
				member.setCtgr_code5(ctgr_code5);
			}
		}
		service.signUp(member);
		service.mailSend(member.getMb_email(), member.getMb_nick());
		//rttr.addFlashAttribute("result", member.getMb_email());
		return "redirect:/";
	}
	
	@GetMapping("/change_key")
	public String key_alterConfirm(@RequestParam("mb_nick") String mb_nick, @RequestParam("mb_email_key") String mb_email_key) {

		service.changeKey(mb_nick, mb_email_key);

		return "/member/signup_success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public int emailCheck(@RequestParam("mb_email") String mb_email) {
		MemberVO emailCheck = service.emailCheck(mb_email);
		log.info("emailCheck : " + emailCheck);
		int result = 0;
		
		if(emailCheck != null) {
			result = 1;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public int nickCheck(@RequestParam("mb_nick") String mb_nick) {
		MemberVO nickCheck = service.nickCheck(mb_nick);
		log.info("nickCheck : " + nickCheck);
		int result = 0;
		
		if(nickCheck != null) {
			result = 1;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public int phoneCheck(@RequestParam("mb_phone") String mb_phone) {
		MemberVO phoneCheck = service.phoneCheck(mb_phone);
		log.info("phoneCheck : " + phoneCheck);
		int result = 0;
		
		if(phoneCheck != null) {
			result = 1;
		}
		
		return result;
	}
	
	@GetMapping("/signin")
	public void signInForm(String error, String logout, Model model) {
		
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		
		log.info("custom logout");
	}
	
	@PostMapping("/customLogout")
	public void logoutPost() {
		
		log.info("post custom logout");
	}
}

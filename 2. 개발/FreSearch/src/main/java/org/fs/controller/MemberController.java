package org.fs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.fs.domain.MemberVO;
import org.fs.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
public class MemberController {
	
	private MemberService service;
	
	private BCryptPasswordEncoder bcrypt;
	
	private GoogleConnectionFactory googleConnectionFactory;
	
	private OAuth2Parameters googleOAuth2Parameters;
	
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
		String mb_pwd = bcrypt.encode(member.getMb_pwd()); 
		member.setMb_pwd(mb_pwd);
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
	
	@ResponseBody
	@RequestMapping(value = "/birthCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public int birthCheck(@RequestParam("mb_birthdate") String mb_birthdate) {
		MemberVO birthCheck = service.birthCheck(mb_birthdate);
		log.info("birthCheck : " + birthCheck);
		int result = 0;
		
		if(birthCheck != null) {
			result = 1;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/findCheck", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<List<MemberVO>> findCheck(@RequestBody MemberVO vo) {
		
		return new ResponseEntity<>(service.findCheck(vo), HttpStatus.OK);
		/*
		String mb_nick = req.getParameter("mb_nick");
		String mb_birthdateStr = req.getParameter("mb_birthdate");
		int mb_birthdate = Integer.parseInt(mb_birthdateStr);
		String mb_phone = req.getParameter("mb_phone");
		
		vo.setMb_nick(mb_nick);
		vo.setMb_birthdate(mb_birthdate);
		vo.setMb_phone(mb_phone);
		
		MemberVO findCheck = service.findCheck(vo);
		
		int result = 0;
		
		if(findCheck != null) {
			log.info("findCheck : " + findCheck);
			result = 1;
		}
		
		return result;
		*/
	}
	/*
	@GetMapping("/signin")
	public void signInForm() {}
	*/
	
	
	//구글code 발행
	@GetMapping("/signin")
	public void signInForm(Model model, HttpSession seesion) {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		
		log.info("구글 : " + url);
		
		model.addAttribute("google_url", url);
		
		//return "signin";
	}
	
	//구글 Callback호출 메소드
	@GetMapping("/signin/oauth2callback")
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");
		
		//return "/index";
		return "/member/googleSignup";
	}
	
	@GetMapping("/googleSignup")
	public void googleSignUpForm() {}
	
	@PostMapping("/googleSignup")
	public String googleSignup(MemberVO member, RedirectAttributes rttr, HttpServletRequest request) {
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
		String mb_pwd = bcrypt.encode(member.getMb_pwd()); 
		member.setMb_pwd(mb_pwd);
		service.googleSignUp(member);
		//rttr.addFlashAttribute("result", member.getMb_email());
		return "redirect:/";
	}
	
	@GetMapping("/email_find")
	public void infoFind() {}
	
	/*
	@ResponseBody
	@RequestMapping(value = "/pwdCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public int pwdCheck(@RequestParam("mb_pwd") String mb_pwd) {
		MemberVO pwdCheck = service.pwdCheck(mb_pwd);
		log.info("pwdCheck : " + pwdCheck);
		int result = 0;
		
		if(pwdCheck != null) {
			result = 1;
		}
		
		return result;
	}*/
	
	/*
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
	}*/
}

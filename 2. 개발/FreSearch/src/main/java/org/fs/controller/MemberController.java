package org.fs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.fs.domain.BoardVO;
import org.fs.domain.Criteria;
import org.fs.domain.MemberVO;
import org.fs.domain.ResearchPageDTO;
import org.fs.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping(value = "/findCheck", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	public int birthCheck(HttpServletRequest req, MemberVO vo) {
		String mb_nick = req.getParameter("mb_nick");
		String mb_birthdateStr = req.getParameter("mb_birthdate");
		int mb_birthdate = Integer.parseInt(mb_birthdateStr);
		String mb_phone = req.getParameter("mb_phone");
		
		vo.setMb_nick(mb_nick);
		vo.setMb_birthdate(mb_birthdate);
		vo.setMb_phone(mb_phone);
		log.info("닉 : " + mb_nick);
		MemberVO findCheck = service.findCheck(vo);
		
		int result = 0;
		
		if(findCheck != null) {
			log.info("findCheck : " + findCheck);
			result = 1;
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/findCheck2", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<List<MemberVO>> findCheck(@RequestBody MemberVO vo) {
		
		return new ResponseEntity<>(service.findCheck2(vo), HttpStatus.OK);
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
	
	//구글code 발행
	@GetMapping("/signin")
	public void signInForm(Model model, HttpSession seesion) {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		
		log.info("구글 : " + url);
		
		model.addAttribute("google_url", url);
	}
	
	@PostMapping("/signin")
	public void signInForm2(@RequestParam("email") String email, Model model) {
		log.info("로그인 이메일" + email);
		model.addAttribute("email", email);
	}

	/*
	@GetMapping(value = "/signin/{email}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MemberVO>> list(@PathVariable("email") String email){
		
		return new ResponseEntity<>(service.emailSignin(email), HttpStatus.OK);
	}*/
	
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
	public void emailFind() {}
	
	@GetMapping("/password_find")
	public void passwordFindForm() {
		
	}
	
	@PostMapping("/password_find")
	public void passwordFind(@RequestParam("email") String email, Model model) {
		log.info("이메일???" + email);
		model.addAttribute("email", email);
	}
	
	@PostMapping("/find_send")
	public String findSend(MemberVO member, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("메일 컨트롤러1" + member.getMb_email());
		service.findSend(member.getMb_email());
		log.info("메일 컨트롤러2" + member.getMb_email());
		//rttr.addFlashAttribute("result", member.getMb_email());
		return "redirect:/member/signin";
	}
	
	@GetMapping("/password_change")
	public void password_change(HttpServletRequest req, Model model) {
		String mb_email = req.getParameter("mb_email");
		log.info("#이메일로 넘어온 값 : " + mb_email);
		model.addAttribute("password_email", mb_email);
	}
	
	@PostMapping("/pwd_change")
	public String pwd_change(MemberVO member, RedirectAttributes ra) {
		
		/*
		if(service.modify(member)) {
			ra.addFlashAttribute("result", "success");
		}	*/
		String mb_pwd = bcrypt.encode(member.getMb_pwd()); 
		member.setMb_pwd(mb_pwd);
		service.pwdChange(member);
		
		return "redirect:/";
	}
	
	/*
	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<List<MemberVO>> check(@RequestBody MemberVO vo) {
		log.info("#컨트롤러 이메일 " + vo.getMb_email());
		return new ResponseEntity<>(service.check(vo), HttpStatus.OK);
	}*/
	
	/*
	@GetMapping("/password_find/{email}")
	public void content(@PathVariable("email") String email, Model model) {
		log.info("이메일정보 : " + email);
		//model.addAttribute("email", service.content(email));	
	}*/
	/*
	@GetMapping(value = "/password_find/{email}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MemberVO> pwdFind(
			@PathVariable("email") String email){
		log.info("이메일정보 : " + email);
		return null;
		//return new ResponseEntity<>(service.pwdFind(email), HttpStatus.OK);
	}*/
	
	/*
	@ResponseBody
	@RequestMapping(value = "/email_find", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<List<MemberVO>> emailFind(@RequestBody MemberVO vo) {
		
		return new ResponseEntity<>(service.emailFind(vo), HttpStatus.OK);
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

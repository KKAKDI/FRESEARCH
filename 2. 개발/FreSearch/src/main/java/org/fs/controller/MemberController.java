package org.fs.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.fs.domain.MemberVO;
import org.fs.service.MemberService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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


	@PostMapping("/myPage")
	@PreAuthorize("isAuthenticated()")
	public String my(Model model,Principal principal) {
		model.addAttribute("myInfo",service.myInfo( principal.getName()));
		model.addAttribute("myTakeList",service.myTakeList( principal.getName()));
		model.addAttribute("myMakeList",service.myMakeList( principal.getName()));
		return "/member/myPage";
	}

	@GetMapping("/signup")
	public void signUpForm() {}

	@PostMapping("/signup")
	public String signUp(MemberVO member, RedirectAttributes rttr, HttpServletRequest request, Model model) {
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

		String mb_email = member.getMb_email();
		String mb_nick = member.getMb_nick();

		try {
			mb_email= URLEncoder.encode(mb_email, "UTF-8");
			mb_nick= URLEncoder.encode(mb_nick, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return "redirect:/member/email_confirm?mb_email="+mb_email+"&mb_nick="+mb_nick;
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
		model.addAttribute("email", email);
	}

	//구글 Callback호출 메소드
	@GetMapping("/signin/oauth2callback")
	public String googleCallback(Model model, @RequestParam String code) throws IOException {
		System.out.println("여기는 googleCallback");

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
		return "redirect:/";
	}

	@GetMapping("/email_find")
	public void emailFind() {}

	@GetMapping("/password_find")
	public void passwordFindForm() {

	}

	@PostMapping("/password_find")
	public void passwordFind(@RequestParam("email") String email, Model model) {
		model.addAttribute("email", email);
	}

	@PostMapping("/find_send")
	public String findSend(MemberVO member, RedirectAttributes rttr, HttpServletRequest request) {
		service.findSend(member.getMb_email());
		return "redirect:/member/signin";
	}

	@GetMapping("/password_change")
	public void password_change(HttpServletRequest req, Model model) {
		String mb_email = req.getParameter("mb_email");
		model.addAttribute("password_email", mb_email);
	}

	@PostMapping("/pwd_change")
	public String pwd_change(MemberVO member, RedirectAttributes ra) {
		String mb_pwd = bcrypt.encode(member.getMb_pwd()); 
		member.setMb_pwd(mb_pwd);
		service.pwdChange(member);

		return "redirect:/";
	}

	@GetMapping("/email_confirm")
	public void emailConfirm(HttpServletRequest request, Model model) {
		String mb_email = request.getParameter("mb_email");
		String mb_nick = request.getParameter("mb_nick");
		model.addAttribute("mb_email", mb_email);
		model.addAttribute("mb_nick", mb_nick);
	}

	@PostMapping("/email_confirm")
	public String emailConfirm(MemberVO member, RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response) {
		String mb_email = request.getParameter("mb_email");
		String mb_nick = request.getParameter("mb_nick");

		service.mailSend(mb_email, mb_nick);

		try {
			mb_email= URLEncoder.encode(mb_email, "UTF-8");
			mb_nick= URLEncoder.encode(mb_nick, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/member/email_confirm?mb_email="+mb_email+"&mb_nick="+mb_nick;
	}
}

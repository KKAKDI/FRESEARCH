package org.fs.service;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import org.fs.domain.MemberVO;
import org.fs.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void signUp(MemberVO member) {
		
		mapper.register(member);
	}
	
	@Override
	public void googleSignUp(MemberVO member) {
		
		mapper.googleRegister(member);
	}
	
	@Override
	public MemberVO emailCheck(String mb_email) {
		
		return mapper.emailCheck(mb_email);
	}
	
	@Override
	public MemberVO nickCheck(String mb_nick) {
		
		return mapper.nickCheck(mb_nick);
	}
	
	@Override
	public MemberVO phoneCheck(String mb_phone) {
		
		return mapper.phoneCheck(mb_phone);
	}
	@Override
	public MemberVO birthCheck(String mb_birthdate) {
		
		return mapper.birthCheck(mb_birthdate);
	}
	
	@Override
	public MemberVO findCheck(MemberVO vo) {

		return mapper.findCheck(vo);
	}
	
	@Override
	public List<MemberVO> check(MemberVO vo) {

		return mapper.check(vo);
	}
	
	@Override
	public List<MemberVO> findCheck2(MemberVO vo) {

		return mapper.findCheck2(vo);
	}
	
	@Override
	public String ranNum() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	private boolean lowerCheck;
	private int size;
	
	@Override
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return ranNum();
	}

	@Override
	public void mailSend(String mb_email, String mb_nick) {
		String key = getKey(false, 20);
		mapper.getKey(mb_nick, key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 FRESEARCH입니다.</h2><br><br>" 
				+ "<h3>" + mb_nick + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8080/member/change_key?mb_nick="+ mb_nick +"&mb_email_key="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setFrom(new InternetAddress("fresearch@naver.com")); //네이버 메일로 보낼때만 적용(구글은 없어도 전송가능)
			mail.setSubject("[본인인증] FRESEARCH 회원가입 인증 메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mb_email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int changeKey(String mb_nick, String mb_email_key) {
		
		int result = 0;
		
		result = mapper.changeKey(mb_nick, mb_email_key);
		
		return result;
	}
	
	@Override
	public void findSend(String mb_email) {
		log.info("서비스impl1 : " + mb_email);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 FRESEARCH입니다.</h2><br><br>" 
				+ "<h3>비밀번호를 찾기 위해 새 비밀번호로 변경하셔야 합니다.</h3>" + "<p>새 비밀번호로 변경 버튼을 누르시면 비밀번호 변경 페이지로 이동합니다" 
				+ "<a href='http://localhost:8080/member/password_change?mb_email="+mb_email+"'> 새 비밀번호로 변경</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setFrom(new InternetAddress("fresearch@naver.com")); //네이버 메일로 보낼때만 적용(구글은 없어도 전송가능)
			mail.setSubject("[본인인증] FRESEARCH 비밀번호 찾기 인증 메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mb_email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean pwdChange(MemberVO member) {
		
		boolean result = mapper.pwdChange(member) == 1;
		
		return result;
	}
}

package org.fs.service;

import java.util.List;

import org.fs.domain.BoardVO;
import org.fs.domain.MemberVO;

public interface MemberService {
	
	public void signUp(MemberVO member);
	public void googleSignUp(MemberVO member);
	
	public MemberVO emailCheck(String mb_email);
	public MemberVO nickCheck(String mb_nick);
	public MemberVO phoneCheck(String mb_phone);
	public MemberVO birthCheck(String mb_birthdate);
	public MemberVO findCheck(MemberVO vo);
	public List<MemberVO> findCheck2(MemberVO vo);
	public boolean pwdChange(MemberVO member);
	
	public String ranNum();
	public String getKey(boolean lowerCheck, int size);
	public void mailSend(String mb_email, String mb_nick);
	public int changeKey(String mb_nick, String mb_email_key);
	
	public void findSend(String mb_email);
	public List<MemberVO> check(MemberVO vo);
}

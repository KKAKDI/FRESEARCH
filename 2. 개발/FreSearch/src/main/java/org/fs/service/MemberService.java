package org.fs.service;

import org.fs.domain.MemberVO;

public interface MemberService {
	
	public void signUp(MemberVO member);
	public void googleSignUp(MemberVO member);
	
	public MemberVO emailCheck(String mb_email);
	public MemberVO nickCheck(String mb_nick);
	public MemberVO phoneCheck(String mb_phone);
	public MemberVO birthCheck(String mb_birthdate);
	//public MemberVO pwdCheck(String mb_pwd);
	
	public String ranNum();
	public String getKey(boolean lowerCheck, int size);
	public void mailSend(String mb_email, String mb_nick);
	public int changeKey(String mb_nick, String mb_email_key);
}

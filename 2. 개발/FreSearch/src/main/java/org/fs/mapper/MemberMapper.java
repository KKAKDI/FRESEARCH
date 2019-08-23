package org.fs.mapper;

import java.util.List;

import org.fs.domain.MemberVO;
import org.fs.domain.MemberVO2;

public interface MemberMapper {
	
	public void register(MemberVO member);
	public void googleRegister(MemberVO member);
	
	public MemberVO emailCheck(String mb_email);
	public MemberVO nickCheck(String mb_nick);
	public MemberVO phoneCheck(String mb_phone);
	public MemberVO birthCheck(String mb_birthdate);
	public List<MemberVO> findCheck(MemberVO vo);
	//public MemberVO pwdCheck(String mb_pwd);
	
	public int getKey(String mb_nick, String mb_email_key);
	public int changeKey(String mb_nick, String mb_email_key);
	
	public MemberVO read(String mb_email);
}

package org.fs.mapper;

import java.util.List;

import org.fs.domain.BoardVO;
import org.fs.domain.MemberVO;
import org.fs.domain.MemberVO2;
import org.fs.domain.MypagelistVO;

public interface MemberMapper {
	
	public void register(MemberVO member);
	public void googleRegister(MemberVO member);
	
	public MemberVO emailCheck(String mb_email);
	public MemberVO nickCheck(String mb_nick);
	public MemberVO phoneCheck(String mb_phone);
	public MemberVO birthCheck(String mb_birthdate);
	public MemberVO findCheck(MemberVO vo);
	public List<MemberVO> findCheck2(MemberVO vo);
	public List<MemberVO> check(MemberVO vo);
	public int pwdChange(MemberVO member);
	
	public int getKey(String mb_nick, String mb_email_key);
	public int changeKey(String mb_nick, String mb_email_key);
	
	public MemberVO read(String mb_email);
	
	public List<MypagelistVO> myTakeList(String mb_email);
	public List<MypagelistVO> myMakeList(String mb_email);
	public MemberVO myPageInfo(String mb_email);
}

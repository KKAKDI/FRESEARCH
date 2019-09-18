package org.fs.mapper;

import java.util.List;

import org.fs.domain.BoardVO;
import org.fs.domain.MemberVO;
import org.fs.domain.MypagelistVO;

public interface MemberMapper {
	
	public void register(MemberVO member);							// 회원가입
	public void googleRegister(MemberVO member);					// 구글 회원가입
	
	public MemberVO emailCheck(String mb_email);					// 이메일 유효성 체크
	public MemberVO nickCheck(String mb_nick);						// 닉네임 유효성 체크
	public MemberVO phoneCheck(String mb_phone);					// 핸드폰번호 유효성 체크
	public MemberVO birthCheck(String mb_birthdate);				// 생년월일 유효성 체크
	public MemberVO findCheck(MemberVO vo);							// 이메일 찾기 유효성 체크
	public List<MemberVO> findCheck2(MemberVO vo);					// 이메일 찾기 성공
	public List<MemberVO> check(MemberVO vo);						
	public int pwdChange(MemberVO member);							// 비밀번호 변경
	
	public int getKey(String mb_nick, String mb_email_key);			// 인증키
	public int changeKey(String mb_nick, String mb_email_key);		// 인증 성공시 인증키 'Y'로 변경
	
	public MemberVO read(String mb_email);							// 시큐리티 로그인
	
	public List<MypagelistVO> myTakeList(String mb_email);
	public List<MypagelistVO> myMakeList(String mb_email);
	public MemberVO myPageInfo(String mb_email);
}

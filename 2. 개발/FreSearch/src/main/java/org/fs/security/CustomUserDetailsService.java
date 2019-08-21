package org.fs.security;

import org.fs.domain.MemberVO;
import org.fs.mapper.MemberMapper;
import org.fs.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_= { @Autowired })
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String mb_email) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + mb_email);
		//MemberVO vo = new MemberVO();
		//String mb_pwd = bcryt.encode(vo.getMb_pwd());
		//log.info("mb_pwd : " + mb_pwd);
		//vo.setMb_pwd(mb_pwd);
		// userName means userid
		MemberVO vo = memberMapper.read(mb_email);
		log.info("mb_pwd : " + vo.getMb_pwd());
		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
}

package org.fs.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.fs.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.log4j.Log4j;
@Log4j
@Getter
public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String mb_email, String mb_pwd,
		Collection<? extends GrantedAuthority> authorities) {
		super(mb_email, mb_pwd, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getMb_email(), vo.getMb_pwd(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		this.member = vo;
	}
}

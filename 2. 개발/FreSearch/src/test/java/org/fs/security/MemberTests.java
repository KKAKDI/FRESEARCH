package org.fs.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/security-context.xml"
  })
@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	  
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	/*
	@Test
	public void testInsertMember() {
		
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		
		//for(int i=0; i<100; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				//pstmt.setString(4, pwencoder.encode("pw" + i));
				
				pstmt.setString(1, "user@naver.com");
				pstmt.setString(2, "B0000001");
				pstmt.setString(3, "일반사용자");
				pstmt.setString(4, pwencoder.encode("pw1"));
				pstmt.setString(5, "주소");
				pstmt.setInt(6, 19890529);
				pstmt.setString(7, "남자");
				pstmt.setString(8, "01011112233");
				pstmt.setString(9, "일반");
				pstmt.setString(10, "Y");
				
				if(i < 80) {
					
					pstmt.setString(1, "user"+i+"@naver.com");
					pstmt.setString(2, "B000000"+i);
					pstmt.setString(3, "일반사용자"+i);
					pstmt.setString(5, "주소"+i);
					pstmt.setInt(6, i);
					pstmt.setString(7, "남자");
					pstmt.setString(8, "0101234567"+i);
					pstmt.setString(9, "일반");
					pstmt.setString(10, "aaa"+i);
					
				}else if(i < 90) {
					
					pstmt.setString(1, "manager"+i+"@gmail.com");
					pstmt.setString(2, "C000000"+i);
					pstmt.setString(3, "운영자"+i);
					pstmt.setString(5, "주소"+i);
					pstmt.setInt(6, i);
					pstmt.setString(7, "여자");
					pstmt.setString(8, "0101234567"+i);
					pstmt.setString(9, "운영자");
					pstmt.setString(10, "bbb"+i);
					
				}else {
					
					pstmt.setString(1, "admin"+i+"@daum.com");
					pstmt.setString(2, "D000000"+i);
					pstmt.setString(3, "관리자"+i);
					pstmt.setString(5, "주소"+i);
					pstmt.setInt(6, i);
					pstmt.setString(7, "남자");
					pstmt.setString(8, "0101234567"+i);
					pstmt.setString(9, "관리자");
					pstmt.setString(10, "ccc"+i);
					
				}
				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
				if(con != null) { try { con.close(); } catch(Exception e) {} }
			}
		//}
	}
	*/
	
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into member_auth(mb_email, mb_att_ctgr_code, auth) values(?,?,?)";
		
		//for(int i=0; i<100; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "user@naver.com");
				pstmt.setString(2, "B0000001");
				pstmt.setString(3, "ROLE_USER");
				/*
				if(i < 80) {
					
					pstmt.setString(1, "user"+i+"@naver.com");
					pstmt.setString(2, "B000000"+i);
					pstmt.setString(3, "ROLE_USER");
					
				}else if(i < 90) {
					
					pstmt.setString(1, "manager"+i+"@gmail.com");
					pstmt.setString(2, "C000000"+i);
					pstmt.setString(3, "ROLE_MANAGER");
					
				}else {
					
					pstmt.setString(1, "admin"+i+"@daum.com");
					pstmt.setString(2, "D000000"+i);
					pstmt.setString(3, "ROLE_ADMIN");
					
				}
				*/
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
				if(con != null) { try { con.close(); } catch(Exception e) {} }
			}
		//}
	}
}

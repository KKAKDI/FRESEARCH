package org.fs.mapper;

import org.fs.domain.MemberVO2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTests2 {
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper2 mapper2;
	
	@Test
	public void testRead() {
		
		MemberVO2 vo2 = mapper2.read("admin90");
		
		log.info(vo2);
		
		vo2.getAuthList().forEach(authVO -> log.info(authVO));
	}
}

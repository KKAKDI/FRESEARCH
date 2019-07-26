package org.fs.mapper;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class testMapper {
	
	
	@Setter(onMethod_= @Autowired)
	private StatsMapper mapper;
	
	
//	@Test
//	public void testlist() {
//		mapper.getList().forEach(stats -> log.info(stats));
//	}
//	@Test
//	public void testMemberList() {
//		mapper.getMemberList().forEach(stats -> log.info(stats));
//	}
//	@Test
//	public void testAttCategory() {
//		log.info(mapper.getAttCategory());
//	}
//	@Test
//	public void testGetAge() {
//		mapper.getAge().forEach(stats -> log.info(stats));
//	}
//	@Test
//	public void getAddr() {
//		
//		log.info(mapper.getAddr("서울"));
//		
//	}
//	@Test
//	public void getCategory() {
//		mapper.getCategory("인천").forEach(stats->log.info(stats));
//	}
//	@Test
//	public void getCategoryAge() {
//		mapper.getCategoryAge(20, 29).forEach(stats->log.info(stats));
////	}
//	@Test
//	public void getCategorySex() {
//		mapper.getCategorySex("여").forEach(stats->log.info(stats));
//	}
//	@Test
//	public void getCategoryMarriage() {
//		mapper.getCategoryMarriage("기혼").forEach(stats->log.info(stats));
//	}
	@Test
	public void getTable() {
		Map<String, String > table = new HashMap<String, String>();
		table.put("ctgrNm", "교육");
		table.put("mbSex", "남");
		table.put("mbAddr", "서울");
		table.put("startAge", "30");
		table.put("endAge", "39");
		//mapper.getTable(table).forEach(stats->log.info(stats));
		log.info(mapper.getTable(table));
	}
	

}

package org.fs.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.fs.domain.Criteria;
import org.fs.domain.StatsVO;
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
//	@Test
//	public void getTable() {
//		StatsVO vo = new StatsVO();
//		vo.setCtgr_nm("교육");
//		vo.setMb_sex("남");
//		vo.setMb_addr("서울");
//		vo.setStartAge(30);
//		vo.setEndAge(39);
//		//mapper.getTable(table).forEach(stats->log.info(stats));
//		log.info(mapper.getTable(vo));
//	}
//	@Test
//	public void getTableTest() {
//		StatsVO vo = new StatsVO();
//		Criteria cri = new Criteria();
//		vo.setCtgr_nm("");
//		vo.setMb_sex("여");
//		vo.setMb_addr("");
//		vo.setStats("전체");
//		vo.setStartAge(0);
//		vo.setEndAge(99);
//		cri.setPageNum(1);
//		cri.setAmount(3);
//		List<StatsVO> list = mapper.getTableTest(vo, cri);
//		list.forEach(stats -> log.info(stats.getSubj_code()));
//	}
	@Test
	public void getTableCount() {
		StatsVO vo = new StatsVO();
		vo.setCtgr_nm("");
		vo.setMb_sex("");
		vo.setMb_addr("");
		vo.setStats("전체");
		vo.setStartAge(0);
		vo.setEndAge(99);

		log.info(mapper.getTableCount(vo));
	}
}

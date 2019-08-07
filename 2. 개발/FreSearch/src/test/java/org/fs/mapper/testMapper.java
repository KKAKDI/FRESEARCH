package org.fs.mapper;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.fs.domain.Criteria;
import org.fs.domain.ResearchVO;
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
//	private ResearchMapper mapper;
	
//	@Test
//	public void testSubReg() {
//		ResearchVO vo = new ResearchVO();
//		vo.setCtgr_code("A0000001");
//		vo.setMb_email("test@test.com");
//		vo.setMb_nick("admin");
//		vo.setSubj_nm("[테스트]설문지제목");
//
//		ResearchVO qstVO = new ResearchVO();
//		qstVO.setMb_email("test@test.com");
//		qstVO.setSubj_nm("[테스트]설문지제목");
//		qstVO.setQst_content("[테스트]질문");
//		qstVO.setQst_type("객관식");
//		qstVO.setQst_img("");
//		qstVO.setQst_url("");
//		
//		ResearchVO itemVO = new ResearchVO();
//		itemVO.setMb_email("test@test.com");
//		itemVO.setSubj_nm("[테스트]설문지제목");
//		itemVO.setItem_content("[테스트]아이템1");
//		itemVO.setItem_img("");
//		
//		ResearchVO itemVO2 = new ResearchVO();
//		itemVO2.setMb_email("test@test.com");
//		itemVO2.setSubj_nm("[테스트]설문지제목");
//		itemVO2.setItem_content("[테스트]아이템2");
//		itemVO2.setItem_img("");
//		
//		if(mapper.subjReg(vo)==1) {
//			if(mapper.qstReg(qstVO)==1) {
//					mapper.itemReg(itemVO);
//					mapper.itemReg(itemVO2);
//				}			
//			}
//				
//	}

	
//	@Test
//	public void testContent() {
//		log.info("researchGetContent: "+mapper.researchGet("N2FVD0F6"));
//	}

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
//		log.info(mapper.getAddr("�꽌�슱"));
//		
//	}
//	@Test
//	public void getCategory() {
//		mapper.getCategory("�씤泥�").forEach(stats->log.info(stats));
//	}
//	@Test
//	public void getCategoryAge() {
//		mapper.getCategoryAge(20, 29).forEach(stats->log.info(stats));
////	}
//	@Test
//	public void getCategorySex() {
//		mapper.getCategorySex("�뿬").forEach(stats->log.info(stats));
//	}
//	@Test
//	public void getCategoryMarriage() {
//		mapper.getCategoryMarriage("湲고샎").forEach(stats->log.info(stats));
//	}
//	@Test
//	public void getTable() {
//		StatsVO vo = new StatsVO();
//		vo.setCtgr_nm("援먯쑁");
//		vo.setMb_sex("�궓");
//		vo.setMb_addr("�꽌�슱");
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
//	@Test
//	public void getTableCount() {
//		StatsVO vo = new StatsVO();
//		vo.setCtgr_nm("");
//		vo.setMb_sex("");
//		vo.setMb_addr("");
//		vo.setStats("전체");
//		vo.setStartAge(0);
//		vo.setEndAge(99);
//
//		log.info(mapper.getTableCount(vo));
//	}
	@Test
	public void getTableSearch() {
		StatsVO vo = new StatsVO();
		Criteria cri = new Criteria();
		vo.setMb_nick("최운학");
		vo.setSubj_nm("");
		cri.setPageNum(1);
		cri.setAmount(3);
		log.info(mapper.getTableSearch(vo, cri));
	}
}

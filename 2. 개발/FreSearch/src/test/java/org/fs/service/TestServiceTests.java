package org.fs.service;

import org.apache.ibatis.annotations.Mapper;
import org.fs.domain.Criteria;
import org.fs.domain.StatsVO;
import org.fs.service.StatsService;
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
public class TestServiceTests {
	
	@Setter(onMethod_ = {@Autowired} )
	//private StatsService service;
	private ResearchService service;
	
	@Test
	public void testAnswer() {
		String values = "admin@fresearch.com#email#admin#nick#2ENCBE9N#code#ㅁ2#value#383ENFG5#code#ㅁㅁ2#value#UFH2QB34#code#ㅁㅁㅁ1#value#03HB7LAQ#code#ㅁㅁㅁㅁ1#value#";
		service.researchAnswer(values);
	}
	/*@Test
	public void testGetList() {
		int CtgrCode = 0;
		service.getList().forEach(stats -> log.info(stats));
		for( StatsVO temp : service.getList()) {
			if(temp.getCtgrCode().equals("B0000001")) {
				CtgrCode++;
				
			}
			log.info("조성식 : "+CtgrCode);
		}
	}*/
	
//	@Test
//	public void testGetList() {
//
//		int sex = 0;
//		for(StatsVO temp : service.getMemberList()) {
//			if(temp.getMbSex().equals("남")) {
//				sex ++;
//				
//			}
//			log.info("남자 : "+sex);
//		}
//
//	}
//	@Test
//	public void testGetAttCategory() {
//		service.getAttCategory().forEach(stats -> log.info(stats));
//	}
//	@Test
//	public void testGetAge() {
//		int ten = 0;
//		int twenty = 0;
//		int thiry = 0;
//		int forty =0;
//		int fifty = 0;
//		int sixty = 0;
//		  
//		service.getAge().forEach(stats -> log.info(stats));
//		int age = service.getAge().get(0).getAge();
//		log.info("조성식 나이 : "+age);
//		
//		for (int i=0; i<service.getAge().size(); i++) {
//			switch (service.getAge().get(i).getAge()/10) {
//			case 1:
//				ten ++;
//				break;
//			case 2:
//				twenty++;
//				break;
//			case 3:
//				thiry++;
//				break;
//			case 4:
//				forty++;
//				break;
//			case 5:
//				fifty++;
//				break;
//			case 6:
//				sixty++;
//				break;
//			default:
//				log.info("에러");
//			}
//		}
//		log.info("10대 : " +ten);
//		log.info("20대: " +twenty);
//		log.info("30대: " +thiry);
//		log.info("40대: " +forty);
//	}
//	@Test
//	public void getAddrTest() {
//		log.info(service.getAddr("서울"));
////	}
//	@Test
//	public void getCategory() {
//		service.getCategory("").forEach(stats -> log.info(stats));
////	}
//	@Test
//	public void getCategoryAge() {
//		service.getCategoryAge(20, 29).forEach(stats -> log.info(stats));
//	}
//	@Test
//	public void getCategorySex() {
//		service.getCategorySex("여").forEach(stats -> log.info(stats));
//	}
//	@Test
//	public void getCategoryMarriage() {
//		service.getCategoryMarriage("기혼").forEach(stats -> log.info(stats));
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
//		log.info(service.getTable(vo));
//	}
//}

//	@Test
//	public void getTableTest() {
//		StatsVO vo = new StatsVO();
//		Criteria cri = new Criteria();
//		vo.setCtgr_nm("");
//		vo.setMb_addr("");
//		vo.setMb_sex("");
//		cri.setPageNum(2);
//		cri.setAmount(2);
//		log.info(service.getTableTest(vo, cri));
//		
//	}
////	
//	@Test
//	public void getTableAllTest() {
//		StatsVO vo = new StatsVO();
//		Criteria cri = new Criteria();
//		vo.setCtgr_nm("");
//		vo.setMb_addr("");
//		vo.setMb_sex("");
//		vo.setStartAge(0);
//		vo.setEndAge(99);
//		vo.setStats("전체");
//		cri.setPageNum(2);
//		cri.setAmount(2);
//		log.info(service.getTableAll(vo, cri));
//	}
//	@Test
//	public void getTableResearch() {
//		StatsVO vo = new StatsVO();
//		Criteria cri = new Criteria();
//		vo.setMb_nick("최운학");
//		vo.setSubj_nm("");
//		cri.setAmount(3);
//		cri.setPageNum(1);
//		log.info(service.getTableSearch(vo,cri));
//	}
			
	
}
		
		
	
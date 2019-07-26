package org.fs.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class StatsControllerTests {
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Before	//모든 메서드가 시작하기전에 얘는 항상 전에 실행된다.
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		
	}
	@Test
	public void testList() throws Exception{
		log.info("Controller testList() : "+mockMvc.perform(MockMvcRequestBuilders.get("/stats/stats_list"))
				.andReturn().getModelAndView().getModelMap());	// MockMvcRequestBuilders이란 존재를 이용해서 get 방식으로 호출한 후 BoardController의 getList()에서 반환된 결과를 이용해서 
																// Model에 어떤 데이터들이 담겨 있는지 확인한다
	}
}

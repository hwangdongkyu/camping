package com.camping.controller;

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

import com.camping.domain.CampingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Log4j2
public class CampingControllerTests {
	
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/camping/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
		
	}
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform
				(MockMvcRequestBuilders.post("/camping/register") 
				.param("board_title", "새로만든 제목")
				.param("board_content", "새로만든 내용")
				.param("mem_id", "user1"))
				.andReturn().getModelAndView().getViewName();
				
				log.info(resultPage);
				
	}
	
	@Test
	public void testGet() throws Exception {
		
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
						.get("/camping/get") 
						.param("Board_no", "1"))
						.andReturn()
						.getModelAndView());

	}
	
	@Test
	public void testModify() throws Exception{
		
		String resultPage = mockMvc
			.perform(MockMvcRequestBuilders.post("/camping/modify")
				.param("Board_no", "1")
				.param("board_title", "수정된 제목")
				.param("board_content", "수정된 내용"))
				.andReturn().getModelAndView().getViewName();
		
			log.info(resultPage);
		
		
	}
	
	@Test
	public void testRemove() throws Exception {
		//삭제전 데이터베이스에 게시물이있는지 확인할것
		String resultPage = mockMvc.perform
							(MockMvcRequestBuilders.post("/camping/remove")
							.param("Board_no", "22"))
							.andReturn().getModelAndView().getViewName();
					
					log.info(resultPage);
	}
	
}

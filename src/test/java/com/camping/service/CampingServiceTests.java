package com.camping.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.CampingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
// Java Config
// @ContextConfiguration(classes = {org.zerock.config.RootConfig.class} )
@Log4j2
public class CampingServiceTests {
	
	@Setter(onMethod_ = { @Autowired })
	private CampingService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		CampingVO camping = new CampingVO(); 
		camping.setBoard_title("새로 작성한 글");
		camping.setBoard_content("새로작성한 내용");
		camping.setMem_id("user5");
		
		service.register(camping);
		
		log.info("생성된 게시물의 번호 : " + camping.getBoard_no());
	}
	
	@Test
	public void testGetlist() {
		
		service.getList().forEach(camping -> log.info(camping));
	}
	
	@Test
	public void testGet() {
		
		log.info(service.get(10L));
	}
	
	@Test
	public void testDelete() {
		
		//게시물의 존재여부를 확인하고 테스트 할것
		log.info("REMOVE RESULT : " + service.remove(10L));
		
	}
	
	@Test
	public void testUpdate() {
		
		CampingVO camping = service.get(18L);
		
		if (camping == null) {
			return;
		}
		
		camping.setBoard_title("제목을 수정합니다");
		log.info("MODIFY RESULT : " + service.modify(camping));
	}
	
}

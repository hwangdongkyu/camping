package com.camping.mapper;

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
@Log4j2
public class CampingMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CampingMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(camping -> log.info(camping));
	}
	
	@Test
	public void testInsert() {
		
		CampingVO camping = new CampingVO();
		camping.setBoard_title("새로작성하는글");
		camping.setBoard_content("새로작성하는내용");
		camping.setMem_id("user5");
		mapper.insert(camping);
		
		log.info(camping);
	}
	
	@Test
	public void testRead() {
		
		//존재하는 게시물 번호로 테스트
		CampingVO camping = mapper.read(10L);
		
		log.info(camping);
		
	}
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT : " + mapper.delete(9L));
	}
	
	@Test
	public void testUpdate() {
		
		CampingVO camping = new CampingVO();
		//실행전 존재하는 번호인지 확인할것
		camping.setBoard_no(10L);
		camping.setBoard_title("수정된 제목");
		camping.setBoard_content("수정된 내용");
		
		int count = mapper.update(camping);
		log.info("UPDATE COUNT : " + count);
		
	}
	
	
	
}

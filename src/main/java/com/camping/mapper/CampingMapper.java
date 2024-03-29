package com.camping.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.camping.domain.CampingVO;

public interface CampingMapper {
	
	//@Select("select * from BOARD_INQUIRY where board_no > 0")
	public List<CampingVO> getList();
	
	public void insert(CampingVO camping);
	
	public void insertSelectKey(CampingVO camping);
	
	public CampingVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(CampingVO camping);
	
}

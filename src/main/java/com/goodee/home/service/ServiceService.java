package com.goodee.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.home.util.Pager;


@Service
public class ServiceService {

	@Autowired
	private ServiceDAO serviceDAO;
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		
		Long totalCount = serviceDAO.getCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		
		
		return serviceDAO.getList(pager);
	}
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception{
		
		return serviceDAO.getDetail(boardDTO);
	}
	
	
	
}

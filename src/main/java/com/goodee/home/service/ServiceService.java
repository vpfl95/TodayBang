package com.goodee.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ServiceService {

	@Autowired
	private ServiceDAO serviceDAO;
	
	public List<BoardDTO> getList(String board) throws Exception{
		
		return serviceDAO.getList(board);
	}
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception{
		
		return serviceDAO.getDetail(boardDTO);
	}
	
}

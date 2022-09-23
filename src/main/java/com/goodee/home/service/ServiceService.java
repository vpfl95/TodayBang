package com.goodee.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ServiceService {

	@Autowired
	private ServiceDAO serviceDAO;
	
	public List<NoticeDTO> getNotice() throws Exception{
		
		return serviceDAO.getNotice();
	}
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO) throws Exception{
		
		return serviceDAO.getNoticeDetail(noticeDTO);
	}
	
}

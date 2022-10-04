package com.goodee.home.store.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InquiryService {

	@Autowired
	private InquiryDAO inquiryDAO;
	
	public int addInquiry(InquiryDTO inquiryDTO) throws Exception {
		inquiryDTO.setBuyStatus(0);
		return inquiryDAO.addInquiry(inquiryDTO);
	}
	
	public List<InquiryDTO> getInauiryList(InquiryDTO inquiryDTO) throws Exception {
		return inquiryDAO.getInauiryList(inquiryDTO);
	}
	
	public int deleteInquiry(InquiryDTO inquiryDTO) throws Exception {
		return inquiryDAO.deleteInquiry(inquiryDTO);
	}
	
	public int replyInquiry(InquiryDTO inquiryDTO) throws Exception {
		return inquiryDAO.replyInquiry(inquiryDTO);
	}
	
	public InquiryDTO getReply(InquiryDTO inquiryDTO) throws Exception {
		return inquiryDAO.getReply(inquiryDTO);
	}
}
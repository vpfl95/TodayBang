package com.goodee.home.store.review;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.home.util.FileManger;

@Service
public class ProductReviewService {

	@Autowired
	private ProductReviewDAO productReviewDAO;
	@Autowired
	private FileManger fileManger;
	
	public int addReview(ProductReviewDTO productReviewDTO, MultipartFile file, ServletContext servletContext) throws Exception {
		
		String fileName = fileManger.saveFile("resources/upload/store/review", servletContext, file);
		productReviewDTO.setFileName(fileName);
		
		return productReviewDAO.addReview(productReviewDTO);
	}
}

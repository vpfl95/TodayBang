package com.goodee.home.store.review;

import java.util.ArrayList;
import java.util.List;

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
		
		if(file == null) {
			productReviewDTO.setFileName("");
		} else {			
			String fileName = fileManger.saveFile("resources/upload/store/review", servletContext, file);
			productReviewDTO.setFileName(fileName);			
		}
		
		return productReviewDAO.addReview(productReviewDTO);
	}
	
	public List<ProductReviewDTO> getReview(ProductReviewDTO productReviewDTO) throws Exception {
		return productReviewDAO.getReview(productReviewDTO);
	}
	
	public List<Long> getGrade(ProductReviewDTO productReviewDTO) throws Exception {
		List<Long> result = productReviewDAO.getGrade(productReviewDTO);
		List<Long> grade = new ArrayList<Long>();
		for(int i=0; i<5; i++) {
			grade.add(i, (long) 0);
		}
		long total = 0;
		for(long i : result) {
			total++;
			if(i == 1) {
				grade.set((int) (i-1), grade.get((int) (i-1))+1);
			} else if(i == 2) {
				grade.set((int) (i-1), grade.get((int) (i-1))+1);
			} else if(i == 3) {
				grade.set((int) (i-1), grade.get((int) (i-1))+1);
			} else if(i == 4) {
				grade.set((int) (i-1), grade.get((int) (i-1))+1);
			} else {
				grade.set((int) (i-1), grade.get((int) (i-1))+1);
			}
		}
		grade.add(total);
		return grade;
	}
	
	public ReviewLikeDTO getHelp(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return productReviewDAO.getHelp(reviewLikeDTO);
	}
	
	public int setHelp(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return productReviewDAO.setHelp(reviewLikeDTO);
	}
	
	public int deleteHelp(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return productReviewDAO.deleteHelp(reviewLikeDTO);
	}
	
	public Long getHelpCount(ReviewLikeDTO reviewLikeDTO) throws Exception {
		return productReviewDAO.getHelpCount(reviewLikeDTO);
	}
	
	public ProductReviewDTO getReviewDetail(ProductReviewDTO productReviewDTO) throws Exception {
		return productReviewDAO.getReviewDetail(productReviewDTO);
	}
	
	public int deleteReview(ProductReviewDTO productReviewDTO) throws Exception {
		return productReviewDAO.deleteReview(productReviewDTO);
	}
}

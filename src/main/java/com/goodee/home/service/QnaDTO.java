package com.goodee.home.service;

import org.springframework.stereotype.Component;

@Component
public class QnaDTO extends BoardDTO {

	
	private Long hit;
	private Boolean checkAnswer;
	
	
	
	
	
	
	public Boolean getCheckAnswer() {
		return checkAnswer;
	}
	public void setCheckAnswer(Boolean checkAnswer) {
		this.checkAnswer = checkAnswer;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	

	
	
	
	
	
	
}

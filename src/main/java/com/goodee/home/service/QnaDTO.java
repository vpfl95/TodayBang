package com.goodee.home.service;

import org.springframework.stereotype.Component;

@Component
public class QnaDTO extends BoardDTO {

	
	
	private Boolean checkAnswer;
	
	
	
	public Boolean getCheckAnswer() {
		return checkAnswer;
	}
	public void setCheckAnswer(Boolean checkAnswer) {
		this.checkAnswer = checkAnswer;
	}
	
	

	
	
	
	
	
	
}

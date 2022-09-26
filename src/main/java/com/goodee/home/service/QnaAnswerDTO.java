package com.goodee.home.service;

import org.springframework.stereotype.Component;

@Component
public class QnaAnswerDTO extends QnaDTO {

	private Long answerNum;

	public Long getAnswerNum() {
		return answerNum;
	}

	public void setAnswerNum(Long answerNum) {
		this.answerNum = answerNum;
	}
	
	
}

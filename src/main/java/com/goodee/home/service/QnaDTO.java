package com.goodee.home.service;

import org.springframework.stereotype.Component;

@Component
public class QnaDTO extends BoardDTO {

	
	private Long hit;
	private String nickname;
	
	
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	
	
	
	
	
}

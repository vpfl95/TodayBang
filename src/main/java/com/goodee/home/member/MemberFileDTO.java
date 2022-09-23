package com.goodee.home.member;

import org.springframework.stereotype.Component;

import com.goodee.home.util.FileDTO;


@Component
public class MemberFileDTO extends FileDTO {

	private String userId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
	
}

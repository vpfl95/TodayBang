package com.goodee.home.interested;

public class InterestedDTO {
	private Long wishNum;
	private String userId;
	private Long num;
	private String roadName;
	
	
	public String getRoadName() {
		return roadName;
	}
	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}
	public Long getWishNum() {
		return wishNum;
	}
	public void setWishNum(Long wishNum) {
		this.wishNum = wishNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	
	
}

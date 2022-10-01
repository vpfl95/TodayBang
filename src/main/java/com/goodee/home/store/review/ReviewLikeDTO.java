package com.goodee.home.store.review;

public class ReviewLikeDTO {

	private Long likeNum;
	private Long revNum;
	private String userId;
	
	public Long getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(Long likeNum) {
		this.likeNum = likeNum;
	}
	public Long getRevNum() {
		return revNum;
	}
	public void setRevNum(Long revNum) {
		this.revNum = revNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
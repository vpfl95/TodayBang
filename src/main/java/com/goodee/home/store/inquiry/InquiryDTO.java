package com.goodee.home.store.inquiry;

import java.sql.Date;

public class InquiryDTO {
	
	private Long inqNum;
	private String contents;
	private Integer buyStatus;
	private Long replyStatus;
	private Date regDate;
	private Long productNum;
	private String userId;
	private Integer priStatus;
	
	public Long getInqNum() {
		return inqNum;
	}
	public void setInqNum(Long inqNum) {
		this.inqNum = inqNum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getBuyStatus() {
		return buyStatus;
	}
	public void setBuyStatus(Integer buyStatus) {
		this.buyStatus = buyStatus;
	}
	public Long getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(Long replyStatus) {
		this.replyStatus = replyStatus;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getPriStatus() {
		return priStatus;
	}
	public void setPriStatus(Integer priStatus) {
		this.priStatus = priStatus;
	}
}
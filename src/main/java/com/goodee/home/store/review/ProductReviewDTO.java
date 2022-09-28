package com.goodee.home.store.review;

import java.sql.Date;

public class ProductReviewDTO {
	
	private Long revNum;
	private Double durStar;
	private Double designStar;
	private Double priceStar;
	private Double deliveryStar;
	private Date regDate;
	private String fileName;
	private Long help;
	private String contents;
	private Long productNum;
	private String userId;
	
	public Long getRevNum() {
		return revNum;
	}
	public void setRevNum(Long revNum) {
		this.revNum = revNum;
	}
	public Double getDurStar() {
		return durStar;
	}
	public void setDurStar(Double durStar) {
		this.durStar = durStar;
	}
	public Double getDesignStar() {
		return designStar;
	}
	public void setDesignStar(Double designStar) {
		this.designStar = designStar;
	}
	public Double getPriceStar() {
		return priceStar;
	}
	public void setPriceStar(Double priceStar) {
		this.priceStar = priceStar;
	}
	public Double getDeliveryStar() {
		return deliveryStar;
	}
	public void setDeliveryStar(Double deliveryStar) {
		this.deliveryStar = deliveryStar;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Long getHelp() {
		return help;
	}
	public void setHelp(Long help) {
		this.help = help;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	
}
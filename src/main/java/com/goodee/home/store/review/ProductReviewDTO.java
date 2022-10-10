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
	private String contents;
	private Long productNum;
	private String userId;
	private Long type;
	
	
	private String brand;
	private String productName;
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getType() {
		if(type == null) {
			type = 0L;
		}
		return type;
	}
	public void setType(Long type) {
		this.type = type;
	}
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
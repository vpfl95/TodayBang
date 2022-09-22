package com.goodee.home.store.product;

import java.sql.Date;

public class ProductDTO {
	private Long productNum;
	private String productName;
	private Long price;
	private Long stock;
	private Double saleRate;
	private String brand;
	private Date regDate;
	private Integer deliDate;
	private Integer todayDeal;
	private Long premium;
	private Long deliFee;
	
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public Double getSaleRate() {
		return saleRate;
	}
	public void setSaleRate(Double saleRate) {
		this.saleRate = saleRate;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Integer getDeliDate() {
		return deliDate;
	}
	public void setDeliDate(Integer deliDate) {
		this.deliDate = deliDate;
	}
	public Long getPremium() {
		return premium;
	}
	public void setPremium(Long premium) {
		this.premium = premium;
	}
	public Long getDeliFee() {
		return deliFee;
	}
	public void setDeliFee(Long deliFee) {
		this.deliFee = deliFee;
	}
	public Integer getTodayDeal() {
		return todayDeal;
	}
	public void setTodayDeal(Integer todayDeal) {
		this.todayDeal = todayDeal;
	}
}
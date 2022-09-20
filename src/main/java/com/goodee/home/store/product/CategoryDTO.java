package com.goodee.home.store.product;

public class CategoryDTO {

	private String categoryNum;
	private Integer tier;
	private String categoryName;
	private String categoryRef;
	
	public String getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}
	public Integer getTier() {
		return tier;
	}
	public void setTier(Integer tier) {
		this.tier = tier;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryRef() {
		return categoryRef;
	}
	public void setCategoryRef(String categoryRef) {
		this.categoryRef = categoryRef;
	}
}
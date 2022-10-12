package com.goodee.home.member;

import com.goodee.home.store.product.ProductOptionDTO;

public class Order_OptionDTO {
	private Long num;
	private Long orderNum;
	private Long optionNum;
	private Long optionCount;
	private ProductOptionDTO productOptionDTO;
	
	public ProductOptionDTO getProductOptionDTO() {
		return productOptionDTO;
	}
	public void setProductOptionDTO(ProductOptionDTO productOptionDTO) {
		this.productOptionDTO = productOptionDTO;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public Long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(Long optionNum) {
		this.optionNum = optionNum;
	}
	public Long getOptionCount() {
		return optionCount;
	}
	public void setOptionCount(Long optionCount) {
		this.optionCount = optionCount;
	}
}
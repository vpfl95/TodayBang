package com.goodee.home.member;

import com.goodee.home.store.product.ProductOptionDTO;

public class Cart_OptionDTO {
	private Long num;
	private Long cartNum;
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
	
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
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

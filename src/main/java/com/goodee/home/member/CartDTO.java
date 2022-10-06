package com.goodee.home.member;

import org.springframework.stereotype.Component;

import com.goodee.home.store.product.Option1DTO;
import com.goodee.home.store.product.Option2DTO;
import com.goodee.home.store.product.Option3DTO;
import com.goodee.home.store.product.ProductDTO;

@Component
public class CartDTO {

	private Long cartNum;
	private String option1;
	private String option2;
	private String option3;
	private Long buyAmount;
	private Long productNum;
	private String userId;
	
	private ProductDTO productDTO;
	private Option1DTO option1DTO;
	private Option2DTO option2DTO;
	private Option3DTO option3DTO;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public Option1DTO getOption1DTO() {
		return option1DTO;
	}
	public void setOption1DTO(Option1DTO option1dto) {
		option1DTO = option1dto;
	}
	public Option2DTO getOption2DTO() {
		return option2DTO;
	}
	public void setOption2DTO(Option2DTO option2dto) {
		option2DTO = option2dto;
	}
	public Option3DTO getOption3DTO() {
		return option3DTO;
	}
	public void setOption3DTO(Option3DTO option3dto) {
		option3DTO = option3dto;
	}
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public Long getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(Long buyAmount) {
		this.buyAmount = buyAmount;
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

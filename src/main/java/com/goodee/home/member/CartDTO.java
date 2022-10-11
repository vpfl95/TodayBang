package com.goodee.home.member;

import java.util.List;

import org.springframework.stereotype.Component;

import com.goodee.home.store.product.ProductDTO;
import com.goodee.home.store.product.ProductOptionDTO;

@Component
public class CartDTO {

	private Long cartNum;
	private Long buyAmount;
	private Long productNum;
	private String userId;
	private String fileName;
	private ProductDTO productDTO;
	
	private List<ProductOptionDTO> productOptionDTOs;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public List<ProductOptionDTO> getProductOptionDTOs() {
		return productOptionDTOs;
	}
	public void setProductOptionDTOs(List<ProductOptionDTO> productOptionDTOs) {
		this.productOptionDTOs = productOptionDTOs;
	}
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
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

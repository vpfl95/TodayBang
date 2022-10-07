package com.goodee.home.member;

import org.springframework.stereotype.Component;

@Component
public class OrderDTO {

	private Long orderNum;
	private String userId;
	private Long cartNum;
	private Long addressNum;
	private String orderDate;
	private String payment;
	private String deliveryStatus;
	
	private CartDTO cartDTO;
	private DeliveryDTO deliveryDTO;
	
	
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public Long getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(Long addressNum) {
		this.addressNum = addressNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public CartDTO getCartDTO() {
		return cartDTO;
	}
	public void setCartDTO(CartDTO cartDTO) {
		this.cartDTO = cartDTO;
	}
	public DeliveryDTO getDeliveryDTO() {
		return deliveryDTO;
	}
	public void setDeliveryDTO(DeliveryDTO deliveryDTO) {
		this.deliveryDTO = deliveryDTO;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package com.goodee.home.member;

import java.sql.Date;

import org.springframework.stereotype.Component;



@Component
public class OrderDTO extends CartDTO{

	private Long orderNum;
	private Long addressNum;
	private Date orderDate;
	private String payment;
	private String deliveryStatus;
	private DeliveryDTO deliveryDTO;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}

	public Long getAddressNum() {
		return addressNum;
	}
	public void setAddressNum(Long addressNum) {
		this.addressNum = addressNum;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
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
	
	public DeliveryDTO getDeliveryDTO() {
		return deliveryDTO;
	}
	public void setDeliveryDTO(DeliveryDTO deliveryDTO) {
		this.deliveryDTO = deliveryDTO;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

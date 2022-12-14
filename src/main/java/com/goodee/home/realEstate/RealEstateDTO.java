package com.goodee.home.realEstate;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.goodee.home.houseImage.HouseImageDTO;

public class RealEstateDTO {
	private Long num;
	private String sigungu;
	private String bunji;
	private String buildType;
	private String buildingNm;
	private String dealType;
	private Long area;
	@JsonFormat(pattern = "YY-MM")
	private Date dealYm;
	@JsonFormat(pattern = "yy-MM-dd")
	private Date dealDay;
	private Long deal;
	private Long deposit;
	private Long wdeposit;
	private Long monthly;
	private Long floor;
	private Long buildYear;
	private String roadName;
	private Long avg;
	
	private String userId;
	
	private String fileName;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getWdeposit() {
		return wdeposit;
	}
	public void setWdeposit(Long wdeposit) {
		this.wdeposit = wdeposit;
	}
	public Long getAvg() {
		return avg;
	}
	public void setAvg(Long avg) {
		this.avg = avg;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	public String getBuildType() {
		return buildType;
	}
	public void setBuildType(String buildType) {
		this.buildType = buildType;
	}
	public String getBuildingNm() {
		return buildingNm;
	}
	public void setBuildingNm(String buildingNm) {
		this.buildingNm = buildingNm;
	}
	public String getDealType() {
		return dealType;
	}
	public void setDealType(String dealType) {
		this.dealType = dealType;
	}
	public Long getArea() {
		return area;
	}
	public void setArea(Long area) {
		this.area = area;
	}
	public Date getDealYm() {
		return dealYm;
	}
	public void setDealYm(Date dealYm) {
		this.dealYm = dealYm;
	}
	public Date getDealDay() {
		return dealDay;
	}
	public void setDealDay(Date dealDay) {
		this.dealDay = dealDay;
	}
	public Long getDeal() {
		return deal;
	}
	public void setDeal(Long deal) {
		this.deal = deal;
	}
	public Long getDeposit() {
		return deposit;
	}
	public void setDeposit(Long deposit) {
		this.deposit = deposit;
	}
	public Long getMonthly() {
		return monthly;
	}
	public void setMonthly(Long monthly) {
		this.monthly = monthly;
	}
	public Long getFloor() {
		return floor;
	}
	public void setFloor(Long floor) {
		this.floor = floor;
	}
	public Long getBuildYear() {
		return buildYear;
	}
	public void setBuildYear(Long buildYear) {
		this.buildYear = buildYear;
	}
	public String getRoadName() {
		return roadName;
	}
	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}
}

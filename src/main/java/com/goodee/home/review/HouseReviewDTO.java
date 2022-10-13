package com.goodee.home.review;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.goodee.home.realEstate.RealEstateDTO;

public class HouseReviewDTO {
	private Long reviewNum;
	private Long grade;
	@JsonFormat(pattern = "yy-MM-dd")
	private Date date;
	private String contents;
	private String userId;
	private Long num;
	private String trfContents;
	private String envContents;
	private String resContents;
	private Long trfGrade;
	private Long envGrade;
	private Long resGrade;
	private RealEstateDTO realEstateDTO;
	
	
	
	public RealEstateDTO getRealEstateDTO() {
		return realEstateDTO;
	}
	public void setRealEstateDTO(RealEstateDTO realEstateDTO) {
		this.realEstateDTO = realEstateDTO;
	}
	public String getTrfContents() {
		return trfContents;
	}
	public void setTrfContents(String trfContents) {
		this.trfContents = trfContents;
	}
	public String getEnvContents() {
		return envContents;
	}
	public void setEnvContents(String envContents) {
		this.envContents = envContents;
	}
	public String getResContents() {
		return resContents;
	}
	public void setResContents(String resContents) {
		this.resContents = resContents;
	}
	public Long getTrfGrade() {
		return trfGrade;
	}
	public void setTrfGrade(Long trfGrade) {
		this.trfGrade = trfGrade;
	}
	public Long getEnvGrade() {
		return envGrade;
	}
	public void setEnvGrade(Long envGrade) {
		this.envGrade = envGrade;
	}
	public Long getResGrade() {
		return resGrade;
	}
	public void setResGrade(Long resGrade) {
		this.resGrade = resGrade;
	}
	public Long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
	public Long getGrade() {
		return grade;
	}
	public void setGrade(Long grade) {
		this.grade = grade;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
}

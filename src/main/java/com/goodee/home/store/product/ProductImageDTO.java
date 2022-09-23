package com.goodee.home.store.product;

public class ProductImageDTO {
	private Long fileNum;
	private String fileName;
	private String oriName;
	private Long detail;
	private Long productNum;
	
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public Long getDetail() {
		return detail;
	}
	public void setDetail(Long detail) {
		this.detail = detail;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
}
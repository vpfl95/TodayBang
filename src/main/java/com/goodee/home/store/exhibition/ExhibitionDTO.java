package com.goodee.home.store.exhibition;

public class ExhibitionDTO {
	private Long exhibitionCode;
	private Long totalScrap;
	private Long totalShare;
	private String exName;
	
	public String getExName() {
		return exName;
	}
	public void setExName(String exName) {
		this.exName = exName;
	}
	public Long getExhibitionCode() {
		return exhibitionCode;
	}
	public void setExhibitionCode(Long exhibitionCode) {
		this.exhibitionCode = exhibitionCode;
	}
	public Long getTotalScrap() {
		return totalScrap;
	}
	public void setTotalScrap(Long totalScrap) {
		this.totalScrap = totalScrap;
	}
	public Long getTotalShare() {
		return totalShare;
	}
	public void setTotalShare(Long totalShare) {
		this.totalShare = totalShare;
	}
}
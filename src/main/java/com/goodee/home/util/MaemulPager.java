package com.goodee.home.util;

public class MaemulPager {

	private String roadName;
	private Long startRow;
	private Long lastRow;
	
	private Long page;
	private Long perPage;
	
	private Long totalPage;
	
	public void makePage(Long totalCount) {
		this.totalPage = totalCount%this.getPerPage()==0 ? totalCount/this.getPerPage() : totalCount/this.getPerPage()+1; 
	}
	
	//startRow
	public void getRowNum(){
		this.startRow = (this.getPage()-1)*this.getPerPage()+1;
		this.lastRow = this.getPage()*this.getPerPage();
	}
	
	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getLastRow() {
		return lastRow;
	}

	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getPage() {
		if(this.page==null || this.page<1L) {
			this.page=1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getPerPage() {
		if(this.perPage==null || this.perPage<1L) {
			this.perPage=5L;
		}
	
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}

	public Long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}

	public String getRoadName() {
		return roadName;
	}

	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}
	
	
}

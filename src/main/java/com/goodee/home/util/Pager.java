package com.goodee.home.util;

public class Pager {
	
	private Long totalPage;	//총 페이지의 수
	private Long startNum;
	private Long lastNum;
	private Long page;		//현재페이지 번호
	private Long perPage;	//한 페이지당 글의 갯수
	private Long perBlock;	//pagination의 수
	private Long startRow;	//페이지에서 글의 시작번호
	private Long lastRow;	//페이지에서 글의 끝 번호
	
	//이전블럭의 유무-이전블럭이 있으면 true, 없으면 false
	private boolean pre;
	//다음블럭의 유무-다음블럭이 있으면 true, 없으면 false
	private boolean next;
	//검색 컬럼의 종류
	private String kind;
	//검색어 
	private String search;
		
	
	public Pager() {
		this.perPage =5L;
		this.perBlock = 5L;
	}
	
	public void getRowNum() {
		this.startRow = (this.getPage()-1)*this.getPerPage() +1;
		this.lastRow = this.getPerPage() * this.getPage();
	}
	
	public void getNum(Long totalCount) {
		this.totalPage = totalCount % this.getPerPage()==0 ? totalCount/this.getPerPage() : totalCount/this.getPerPage() +1;
		Long totalBlock = this.totalPage % this.getPerBlock()==0 ? this.totalPage/this.getPerBlock() : this.totalPage/this.getPerBlock()+1;
		Long curBlock = this.getPage() % this.getPerBlock()==0 ? this.getPage()/this.getPerBlock() : this.getPage()/this.getPerBlock()+1;
		
		this.startNum = (curBlock-1)*this.getPerBlock()+1;
		this.lastNum = curBlock*this.getPerBlock();
		
		if(curBlock==totalBlock) {
			this.lastNum=totalPage;
		}
		
		if(curBlock>1) {
			pre=true;
		}
		
		if(curBlock<totalBlock) {
			next=true;
		}
		
	}
	
	
	
	public Long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}
	public Long getStartNum() {
		return startNum;
	}
	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}
	public Long getLastNum() {
		return lastNum;
	}
	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
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
	public Long getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(Long perBlock) {
		this.perBlock = perBlock;
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
	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}

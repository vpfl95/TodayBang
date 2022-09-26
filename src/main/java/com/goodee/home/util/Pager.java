package com.goodee.home.util;

public class Pager {
	private Long page;
	private Long startNum;
	private Long lastNum;
	private Long startRow;
	private Long lastRow;
	private Long perPage;
	private Long perBlock;
	
	//이전블럭의 유무-이전블럭이 있으면 true, 없으면 false
	private boolean pre;
	//다음블럭의 유무-다음블럭이 있으면 true, 없으면 false
	private boolean next;
	private String board;
	
	//검색 컬럼의 종류
	private String kind;
	//검색어 
	private String search;
	
	
	
	
	
	
	
	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public Pager() {
		this.perPage=10L;
		this.perBlock=5L;
	}
	
	public void getRowNum(){
		startRow = (this.getPage()-1)*this.getPerPage()+1;
		lastRow = this.getPage()*this.getPerPage();
	}
	
	
	public void getNum(Long totalCount)throws Exception{
		//2.totalcount로 totalPage 구하기(총 페이지 개수)
		Long totalPage = totalCount % this.getPerPage()==0 ? totalCount/this.getPerPage() : totalCount/this.getPerPage()+1;
		//3.totalPage를 이용해 totalBlock 구하기
		Long totalBlock =  totalPage % this.getPerBlock() == 0 ? totalPage/this.getPerBlock() : totalPage/this.getPerBlock()+1;
		//4. page로 curBlock 찾기
		Long curBlock = this.getPage() % this.getPerBlock()== 0 ? this.getPage()/this.getPerBlock() : this.getPage()/this.getPerBlock()+1;
		//5. curBlock으로 startNum(시작번호),lastNum(끝번호) 구하기
		this.startNum = (curBlock-1)*this.getPerBlock() + 1;
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
	
	public Long getPage() {
		if(this.page==null || this.page<1L) {
			this.page=1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
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

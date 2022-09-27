package com.goodee.home.service;

import org.springframework.stereotype.Component;

@Component
public class BoardDTO {

	private Long boardNum;
	private String title;
	private String contents;
	private String regDate;
	private String userId;
	private String board;
	private BoardFileDTO boardFileDTO;
	
	
	
	
	
	
	public BoardFileDTO getBoardFileDTO() {
		return boardFileDTO;
	}
	public void setBoardFileDTO(BoardFileDTO boardFileDTO) {
		this.boardFileDTO = boardFileDTO;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
	}
	public Long getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(Long boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
	
}

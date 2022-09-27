package com.goodee.home.service;

import org.springframework.stereotype.Component;

import com.goodee.home.util.FileDTO;

@Component
public class BoardFileDTO extends FileDTO {

	private Long boardNum;
	private String board;

	
	
	
	
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
	
	
	
}

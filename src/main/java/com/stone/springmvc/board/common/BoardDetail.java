package com.stone.springmvc.board.common;

public class BoardDetail {
	Board board;
	Boolean isWriter;
	
	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}
	public boolean getIsWriter() {
		return isWriter;
	}
	public void setWriter(boolean isWriter) {
		this.isWriter = isWriter;
	}
	
	
}

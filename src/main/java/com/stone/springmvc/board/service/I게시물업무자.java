package com.stone.springmvc.board.service;

import java.util.List;

import com.stone.springmvc.board.common.Board;

public interface I게시물업무자 {
	public  boolean 게시물작성이가능한가();	
	public void 게시물을등록하다(Board 새게시물);
	public List<Board> 모든게시물을수집하다();
	public Object[] 게시물목록을수집하다(int 시작게시물일련번호, int 최대수집크기);
	public Board 게시물을조회하다And조회수증가하다(int 게시물번호);
	public Board 게시물변경준비하다(int no);
	public void 게시물을변경하다(Board board);
	public void 게시물을삭제하다(int no);
}

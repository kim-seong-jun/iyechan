package com.stone.springmvc.board.dataservice;

import java.util.List;

import com.stone.springmvc.board.common.Board;

public interface I게시물DAO {
	public  void  저장하다(Board 새게시물);
	public List<Board> 모든게시물을수집하다();
	public Object[] 수집하다(int 시작게시물일련번호/*one-base*/, int 최대수집크기);
	public Board 게시물을찾다And조회수증가하다(int 게시물번호);
	public Board 찾는다by번호(int 게시물번호);
	public void 변경하다(Board 변경할게시물);
	public void 삭제하다(int 번호);
}

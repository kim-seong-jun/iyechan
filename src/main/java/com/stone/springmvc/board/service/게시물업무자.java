package com.stone.springmvc.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.board.common.Board;
import com.stone.springmvc.board.dataservice.I게시물DAO;

@Service
public class 게시물업무자 implements I게시물업무자 {
    @Autowired I게시물DAO 게시물DAO;
	
	@Override
	public boolean 게시물작성이가능한가() {
	
		return true;
	}

	@Override
	public void 게시물을등록하다(Board 새게시물) {
		
		게시물DAO.저장하다(새게시물);
	}

	@Override
	public List<Board> 모든게시물을수집하다() {		
		return 게시물DAO.모든게시물을수집하다();
	}

	@Override
	public Object[] 게시물목록을수집하다(int 시작게시물일련번호, int 최대수집크기) {
		return 게시물DAO.수집하다(시작게시물일련번호, 최대수집크기);
	}
	
	@Override
	public Board 게시물을조회하다And조회수증가하다(int 게시물번호) {
		
		return 게시물DAO.게시물을찾다And조회수증가하다(게시물번호);
	}

	@Override
	public Board 게시물변경준비하다(int no) {
		return 게시물DAO.찾는다by번호(no);
	}

	@Override
	public void 게시물을변경하다(Board board) {
		게시물DAO.변경하다(board);
	}

	@Override
	public void 게시물을삭제하다(int no) {
		게시물DAO.삭제하다(no);
	}


}

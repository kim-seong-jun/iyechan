package com.stone.springmvc.board.dataservice;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.springmvc.board.common.Board;

@Repository
public class 게시물DAO implements I게시물DAO {
	@Autowired I게시물Mapper boardDAO; 
	
	@Transactional
	@Override
	public void 저장하다(Board 새게시물) {
		boardDAO.save(새게시물);
	}

	@Override
	public List<Board> 모든게시물을수집하다() {
		return boardDAO.selectAll();
	}
	
	@Override
	public Object[] 수집하다(int 시작게시물일련번호, int 최대수집크기) {
		System.out.println("in 수집하다");
		System.out.println("시작게시물일련번호 = " + 시작게시물일련번호);
		System.out.println("최대수집크기 = " + 최대수집크기);
		
		List<Board> 게시물들 =new ArrayList<Board>();		
		int 수집된게시물수=0;
		
		수집된게시물수 = boardDAO.selectCount();
		System.out.println("수집된게시물수 = " + 수집된게시물수);
		
		게시물들 = boardDAO.selectByPage(시작게시물일련번호-1, 최대수집크기);
		Object 게시물들과수집된게시물수[] = {게시물들, 수집된게시물수};
		
		return 게시물들과수집된게시물수;
	}

	@Override
	public Board 게시물을찾다And조회수증가하다(int 게시물번호) {
		boardDAO.updateViews(게시물번호);
		return boardDAO.selectByNo(게시물번호);
	}
	
	@Override
	public Board 찾는다by번호(int 게시물번호) {
		return boardDAO.selectByNo(게시물번호);
	}
	
	@Transactional
	@Override
	public void 변경하다(Board 변경할게시물) {
		boardDAO.updateBoard(변경할게시물);
	}
	
	@Transactional
	@Override
	public void 삭제하다(int 번호) {
		boardDAO.deleteBoard(번호);
	}

}

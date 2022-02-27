package com.stone.springmvc.board.presentation;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.springmvc.board.common.Board;
import com.stone.springmvc.board.common.BoardDetail;
import com.stone.springmvc.board.common.BoardList;
import com.stone.springmvc.board.common.PageInfo;
import com.stone.springmvc.board.service.I게시물업무자;
import com.stone.springmvc.member.common.Member;


@Controller
public class 게시물컨트롤러 { 
	@Autowired I게시물업무자 게시물업무자;
	
	//게시물등록
	@PostMapping("/board")
	@ResponseBody 
	public String 게시물을등록하다(@RequestBody Board 새게시물, HttpSession session) {
		int 로그인한회원의번호 = 0;
		if(session!=null && session.getAttribute("회원번호")!=null) {
			로그인한회원의번호=(int)session.getAttribute("회원번호");
			//로그인한 회원이 작성자이므로 새게시물에 작성자를 set 해주어야함
		} else {
			return "reqLogin";
		}
		Member 작성한회원=new Member();
		작성한회원.setNo(로그인한회원의번호);
		새게시물.setWriter(작성한회원);
		
		게시물업무자.게시물을등록하다(새게시물);
		
		return "success";
	}
	//게시물목록출력
	@PostMapping("/boards")
	@ResponseBody 
	public BoardList 게시물목록출력하다(@RequestBody PageInfo pageInfo) {
		int 페이지번호 = (pageInfo.getPage() > 0) ? pageInfo.getPage():1;
		int 페이지당게시물수 = pageInfo.getListSize();
		int 범위끝게시물일련번호=페이지당게시물수*페이지번호;
		//예를들어 페이지가 1이면 범위시작게시물일련번호 1 범위끝 게시물일련번호 5
		//           2                  6               10
		//           3                  11              15 
		int 시작게시물일련번호= 범위끝게시물일련번호-(페이지당게시물수-1);

		Object[] 수집된게시물들과게시물수 = 게시물업무자.게시물목록을수집하다(시작게시물일련번호, 페이지당게시물수);

		int 수집된게시물수=(int)수집된게시물들과게시물수[1];		//수집된 전체 게시물수
		int 마지막페이지번호=(int)Math.ceil((double)수집된게시물수/페이지당게시물수);
		
		BoardList boardList = new BoardList();
		boardList.setBoardList((List<Board>)수집된게시물들과게시물수[0]);
		boardList.setLastPageNo(마지막페이지번호);
		boardList.setPageNo(페이지번호);
		
		return boardList; 
	}
	
	//게시물상세정보
	@GetMapping("/board/{게시물번호}")
	@ResponseBody
	public BoardDetail 게시물상세츨력하다(@PathVariable int 게시물번호,HttpSession session) {
		Board 찾은게시물=게시물업무자.게시물을조회하다And조회수증가하다(게시물번호);
		
		Boolean isWriter=false; 
		if(session!=null) { 
			Integer 회원번호=(Integer)session.getAttribute("회원번호"); 
			System.out.println("회원번호 = " +회원번호);
			if(회원번호!=null) { 
				//로그인된 경우 
				//로그인 회원와 게시물 작성자가 동일 인물 
				if(회원번호==찾은게시물.getWriter().getNo()) {
					isWriter=true; 
				} 
			} 
			System.out.println("isWriter = " +isWriter);
		}
		  
		BoardDetail boardDetail = new BoardDetail();
		boardDetail.setBoard(찾은게시물);
		boardDetail.setWriter(isWriter);
		
		return boardDetail;
	}
	
	//게시물변경
	@PostMapping("/updateBoard")
	@ResponseBody 
	public String 게시물을변경하다(@RequestBody Board board) {
		게시물업무자.게시물을변경하다(board);
		return "success";
	}
	//게시물삭제
	@GetMapping("/deleteBoard/{게시물번호}")
	@ResponseBody 
	public String 게시물을삭제하다(@PathVariable int 게시물번호) {
		게시물업무자.게시물을삭제하다(게시물번호);
		return "success";
	}
	
}

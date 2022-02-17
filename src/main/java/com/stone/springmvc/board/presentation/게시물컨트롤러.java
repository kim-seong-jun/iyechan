package com.stone.springmvc.board.presentation;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.board.common.Board;
import com.stone.springmvc.board.common.BoardList;
import com.stone.springmvc.board.common.PageInfo;
import com.stone.springmvc.board.service.I게시물업무자;
import com.stone.springmvc.member.common.Member;


@Controller
public class 게시물컨트롤러 { 
	@Autowired I게시물업무자 게시물업무자;
	
	//게시물등록
	@PostMapping("/board")
	public String 게시물을등록하다(Board 새게시물, HttpSession session) {
		int 로그인한회원의번호 = 9999;//guest
		if(session!=null && session.getAttribute("회원번호")!=null) {
			로그인한회원의번호=(int)session.getAttribute("회원번호");
			//로그인한 회원이 작성자이므로 새게시물에 작성자를 set 해주어야함
		} 
		Member 작성한회원=new Member();
		작성한회원.setNo(로그인한회원의번호);
		새게시물.setWriter(작성한회원);
		
		게시물업무자.게시물을등록하다(새게시물);
		
		
		return "redirect:/main#board";
	}
	//게시물목록출력 (비동기 요청)
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
		System.out.println("페이지번호 = " + 페이지번호);
		System.out.println("범위끝게시물일련번호::: = " + 범위끝게시물일련번호);
		System.out.println("시작게시물일련번호 = " + 시작게시물일련번호);

		Object[] 수집된게시물들과게시물수 = 게시물업무자.게시물목록을수집하다(시작게시물일련번호, 페이지당게시물수);

		int 수집된게시물수=(int)수집된게시물들과게시물수[1];		//수집된 전체 게시물수
		int 마지막페이지번호=(int)Math.ceil((double)수집된게시물수/페이지당게시물수);
		
		BoardList boardList = new BoardList();
		boardList.setBoardList((List<Board>)수집된게시물들과게시물수[0]);
		boardList.setLastPageNo(마지막페이지번호);
		boardList.setPageNo(페이지번호);
		
		return boardList; 
	}
	
	//게시물목록출력
	@RequestMapping("/boards/{페이지번호}")
	ModelAndView 게시물목록출력하다(@PathVariable int 페이지번호){
		페이지번호 = (페이지번호 > 0) ? 페이지번호:1;
		int 페이지당게시물수 = 10;
		int 범위끝게시물일련번호=페이지당게시물수*페이지번호;
		//예를들어 페이지가 1이면 범위시작게시물일련번호 1 범위끝 게시물일련번호 5
		//           2                  6               10
		//           3                  11              15 
		int 시작게시물일련번호= 범위끝게시물일련번호-(페이지당게시물수-1);
		System.out.println("페이지번호 = " + 페이지번호);
		System.out.println("범위끝게시물일련번호::: = " + 범위끝게시물일련번호);
		System.out.println("시작게시물일련번호 = " + 시작게시물일련번호);

		Object[] 수집된게시물들과게시물수 = 게시물업무자.게시물목록을수집하다(시작게시물일련번호, 페이지당게시물수);

		int 수집된게시물수=(int)수집된게시물들과게시물수[1];		//수집된 전체 게시물수
		int 마지막페이지번호=(int)Math.ceil((double)수집된게시물수/페이지당게시물수);
		//int 마지막페이지번호=(int)(수집된게시물수/페이지당게시물수)+((수집된게시물수%페이지당게시물수>0)?1:0);
		
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.setViewName("redirect:/main#board");
		modelAndView.addObject("boards",수집된게시물들과게시물수[0]);
		modelAndView.addObject("pageNo", 페이지번호);
		modelAndView.addObject("lastPageNo", 마지막페이지번호);
		
		return modelAndView;
	}
	
	//게시물상세정보
	@GetMapping("/board/{게시물번호}")
	public ModelAndView 게시물상세츨력하다(@PathVariable int 게시물번호,HttpSession session) {
		Board 찾은게시물=게시물업무자.게시물을조회하다And조회수증가하다(게시물번호);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board/게시물상세창");
		mv.addObject("board",찾은게시물);
		//로그인 안되어 있으면=>  로그인회원와게시물작성자가동일인물인가=null
		Boolean 로그인회원와게시물작성자가동일인물인가=null;
	    if(session!=null) {
	    	Integer 회원번호=(Integer)session.getAttribute("회원번호");
	    	 if(회원번호!=null) { //로그인된 경우
	    		 //로그인 회원와 게시물 작성자가 동일 인물
	    		 if(회원번호==찾은게시물.getWriter().getNo()) {
	    			 로그인회원와게시물작성자가동일인물인가=true;
	    		 }
	    		 else //로그인 회원와 게시물 작성자가 다른 인물
	    		 {
	    			 로그인회원와게시물작성자가동일인물인가=false;
	    		 }
	    	 }
	    }
	    
		mv.addObject("isWriter", 로그인회원와게시물작성자가동일인물인가);
		return mv;
	}
	//게시물변경준비
	@GetMapping("/update/{게시물번호}")
	ModelAndView 게시물변경준비하다(@PathVariable int 게시물번호){
		Board 찾은게시물 = 게시물업무자.게시물변경준비하다(게시물번호);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("board/게시물변경창");
		modelAndView.addObject("board", 찾은게시물);
		return modelAndView;
	}
	//게시물변경
	@PostMapping("/update")
	ModelAndView 게시물을변경하다(Board board) {
		게시물업무자.게시물을변경하다(board);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("board/게시물변경통보창");//command
		return modelAndView;
	}
	//게시물삭제
	@GetMapping("/delete/{게시물번호}")
	ModelAndView 게시물을삭제하다(@PathVariable int 게시물번호) {
		게시물업무자.게시물을삭제하다(게시물번호);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("board/게시물삭제통보창");//command
		return modelAndView;
	}
	
}

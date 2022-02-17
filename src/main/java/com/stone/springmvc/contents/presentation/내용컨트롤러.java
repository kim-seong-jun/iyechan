package com.stone.springmvc.contents.presentation;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class 내용컨트롤러 {
	
	@GetMapping("/main")
	public ModelAndView 메인페이지를주다(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//로그인유무
		mv.setViewName("contents/main");		
		boolean 로그인중=(session.getAttribute("id")!=null)?true:false;
		mv.addObject("isLogin",로그인중);
		
		return mv;
	}
}

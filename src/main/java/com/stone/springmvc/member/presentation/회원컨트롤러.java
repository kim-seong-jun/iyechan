package com.stone.springmvc.member.presentation;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.service.I회원업무자;

@Controller
public class 회원컨트롤러 {
	@Autowired I회원업무자 회원업무자;
	
	//내정보 (비동기 요청)
	@PostMapping("/member")
	@ResponseBody 
	public Member 회원자신의정보를보다(HttpSession session) {
		int 로그인한회원의번호=(int)session.getAttribute("회원번호");
		Member member = 회원업무자.조회하다by회원번호(로그인한회원의번호);
		
		return member; 
	}
}

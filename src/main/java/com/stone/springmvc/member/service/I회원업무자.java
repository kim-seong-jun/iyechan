package com.stone.springmvc.member.service;

import com.stone.springmvc.member.common.Member;

public interface I회원업무자 {
	public Member 조회하다(String id, String  password);
	public Member 조회하다by회원번호(int no);
	
}

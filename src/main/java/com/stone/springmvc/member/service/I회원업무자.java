package com.stone.springmvc.member.service;

import java.util.List;

import com.stone.springmvc.member.common.Member;

public interface I회원업무자 {
	public void 회원정보저장하다(Member member);
	public Member 조회하다by회원번호(int no);
	public boolean id가있는가(String id);
	public boolean 회원인가(String id, String password);
	public Member 조회하다(String id, String  password);
	public List<Member> 회원목록을조회하다();
	public void 회원정보를수정하다(Member member);
	public void 회원상태를변경하다(int status, int no);
	public void 회원을삭제하다(int no);
}

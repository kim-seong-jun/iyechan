package com.stone.springmvc.member.dataservice;

import java.util.List;

import com.stone.springmvc.member.common.Member;

public interface I회원DAO {
	void 회원정보저장하다(Member 새회원);
	Member findByNo(int no);
	boolean ID가있는가(String id);
	boolean 회원인가(String id,String password);
	Member 찾다ID와PASSWORD(String id,String password);
	List<Member> 회원목록을조회하다();
	void 회원정보를수정하다(Member member);
	void 회원상태를변경하다(int status, int no);
	void 회원을삭제하다(int no);
}
package com.stone.springmvc.member.dataservice;

import com.stone.springmvc.member.common.Member;

public interface I회원DAO {
	Member findByNo(int no);
	boolean ID가있는가(String id);
	void 회원정보저장하다(Member 새회원);
	boolean 회원인가(String id,String password);
	Member 찾다ID와PASSWORD(String id,String password);
}
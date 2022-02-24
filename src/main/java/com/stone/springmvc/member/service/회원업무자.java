package com.stone.springmvc.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.dataservice.I회원DAO;

@Service
public class 회원업무자 implements I회원업무자 {
	@Autowired I회원DAO 회원DAO; 

	@Override
	public Member 조회하다(String id, String password) {
			return 회원DAO.찾다ID와PASSWORD(id, password);
	}

	@Override
	public Member 조회하다by회원번호(int no) {
		return 회원DAO.findByNo(no);
	}

	@Override
	public void 회원정보저장하다(Member member) {
		회원DAO.회원정보저장하다(member);
		
	}

	@Override
	public boolean id가있는가(String id) {
		return 회원DAO.ID가있는가(id);
	}

	@Override
	public boolean 회원인가(String id, String password) {
		return 회원DAO.회원인가(id, password);
	}

	@Override
	public List<Member> 회원목록을조회하다() {
		return 회원DAO.회원목록을조회하다();
	}

	@Override
	public void 회원정보를수정하다(Member member) {
		회원DAO.회원정보를수정하다(member);
	}

	@Override
	public void 회원상태를변경하다(int status, int no) {
		회원DAO.회원상태를변경하다(status, no);
	}

	@Override
	public void 회원을삭제하다(int no) {
		회원DAO.회원을삭제하다(no);
	}

}

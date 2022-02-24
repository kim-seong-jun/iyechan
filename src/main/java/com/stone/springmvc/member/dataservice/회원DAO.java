package com.stone.springmvc.member.dataservice;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stone.springmvc.member.common.Member;

@Repository
public class 회원DAO implements I회원DAO {
	@Autowired I회원Mapper 회원DAO;

	@Override
	public void 회원정보저장하다(Member 새회원) {
		회원DAO.회원정보저장하다(새회원);
	}

	@Override
	public Member findByNo(int no) {
		return 회원DAO.findByNo(no);
	}

	@Override
	public boolean ID가있는가(String id) {
		return 회원DAO.ID가있는가(id);
	}


	@Override
	public boolean 회원인가(String id, String password) {
		return 회원DAO.회원인가(id, password);
	}

	@Override
	public Member 찾다ID와PASSWORD(String id, String password) {
		return 회원DAO.찾다ID와PASSWORD(id, password);
	}

	@Override
	public List<Member> 회원목록을조회하다() {
		return 회원DAO.selectAll();
	}

	@Override
	public void 회원정보를수정하다(Member member) {
		회원DAO.updateMember(member);
		
	}

	@Override
	public void 회원상태를변경하다(int status, int no) {
		회원DAO.memberStatus(status, no);
	}

	@Override
	public void 회원을삭제하다(int no) {
		회원DAO.deleteMember(no);
	}


}

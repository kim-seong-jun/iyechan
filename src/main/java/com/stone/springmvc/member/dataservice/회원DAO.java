package com.stone.springmvc.member.dataservice;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stone.springmvc.member.common.Member;

@Repository
public class 회원DAO implements I회원DAO {
	@Autowired I회원Mapper 회원DAO;

	@Override
	public Member findByNo(int no) {
		return 회원DAO.findByNo(no);
	}

	@Override
	public boolean ID가있는가(String id) {
		return 회원DAO.ID가있는가(id);
	}

	@Override
	public void 회원정보저장하다(Member 새회원) {
		회원DAO.회원정보저장하다(새회원);
	}

	@Override
	public boolean 회원인가(String id, String password) {
		return 회원DAO.회원인가(id, password);
	}

	@Override
	public Member 찾다ID와PASSWORD(String id, String password) {
		System.out.println("회원DAO id = " + id);
		return 회원DAO.찾다ID와PASSWORD(id, password);
	}


}

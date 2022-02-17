package com.stone.springmvc.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.dataservice.I회원Mapper;

@Service
public class 회원업무자 implements I회원업무자 {
	@Autowired I회원Mapper 회원DAO; 

	@Override
	public Member 조회하다(String id, String password) {
			System.out.println("회원업무자-조회하다");
			System.out.println("id = " + id);
			return 회원DAO.찾다ID와PASSWORD(id, password);
	}

	@Override
	public Member 조회하다by회원번호(int no) {
		return 회원DAO.findByNo(no);
	}

}

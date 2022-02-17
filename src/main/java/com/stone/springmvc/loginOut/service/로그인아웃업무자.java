package com.stone.springmvc.loginOut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.springmvc.member.common.Member;
import com.stone.springmvc.member.dataservice.I회원DAO;
import com.stone.springmvc.member.service.*;

@Service
public class 로그인아웃업무자 implements I로그인아웃업무자 {
	@Autowired I회원DAO 회원DAO;
	
	@Override
	public boolean 로그인준비가능한가() {
				
		return true;
	}
	/*
	public boolean  로그인이가능한가(String id, String  password) {
		
		return 회원업무자.있는가(id, password);
	}
	*/
	
	@Override
	public Member  로그인조회하다(String id, String  password) {
		System.out.println("로그인아웃업무자-로그인조회하다 id = " + id);
		return 회원DAO.찾다ID와PASSWORD(id, password);
	}
}

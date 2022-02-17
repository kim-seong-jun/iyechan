package com.stone.springmvc.board.common;

import java.sql.Date;

import com.stone.springmvc.member.common.Member;

public class Board {
	int no;
	String title;
	String contents;
	Member writer;//객체간의 관계는 참조로 구현한다.
	Date regdate;
	Date chgdate;
	int views; //조회수
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getChgdate() {
		return chgdate;
	}
	public void setChgdate(Date chgdate) {
		this.chgdate = chgdate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
}

package com.stone.springmvc.orders.common;

import java.sql.Date;

import com.stone.springmvc.member.common.Member;

public class Orders {
	int orderNo;			//주문번호
	Member member;			//회원
	String name;			//아이이름
	boolean isAllergie;		//알레르기유무
	String allergieName;	//알레르기상세
	String post;			//우편번호
	String address;			//주소
	String detailAddress;	//상세주소
	String password;		//현관비밀번호
	String bankInfo;		//입금정보
	String receiveType;		//수령방법
	String infoPath;		//알게된 경로
	Date regDate;			//주문일자
	int status;				//0.임시저장/1.주문저장/2.배송준비/3.배송중/3.배송완료/4.취소
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isAllergie() {
		return isAllergie;
	}
	public void setAllergie(boolean isAllergie) {
		this.isAllergie = isAllergie;
	}
	public String getAllergieName() {
		return allergieName;
	}
	public void setAllergieName(String allergieName) {
		this.allergieName = allergieName;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBankInfo() {
		return bankInfo;
	}
	public void setBankInfo(String bankInfo) {
		this.bankInfo = bankInfo;
	}
	public String getReceiveType() {
		return receiveType;
	}
	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}
	public String getInfoPath() {
		return infoPath;
	}
	public void setInfoPath(String infoPath) {
		this.infoPath = infoPath;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}

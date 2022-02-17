package com.stone.springmvc.orders.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.stone.springmvc.board.common.Board;
import com.stone.springmvc.orders.common.Orders;

@Mapper
public interface I주문Mapper {
	
	//주문서 저장
	@Insert("insert into orders(member, name, isAllergie, allergieName, post, address, detailAddress, password, bankInfo, receiveType, infoPath, regDate, status) "
			+ "values(#{member.no}, #{name}, #{isAllergie}, #{allergieName}, #{post}, #{address}, #{detailAddress}, #{password}, #{bankInfo}, #{receiveType}, #{infoPath}, sysdate(), 1)")
	void save(Orders order);		

	//주문서 전체조회 
	@Select("select * from orders order by regDate desc")
	@Results(value= {
			@Result(property="orderNo", column="orderNo"),
			@Result(property="member", column="member",one=@One(select="com.stone.springmvc.member.dataservice.I회원Mapper.findByNo")),
			@Result(property="name", column="name"),
			@Result(property="isAllergie", column="isAllergie"),
			@Result(property="allergieName", column="allergieName"),
			@Result(property="post", column="post"),
			@Result(property="address", column="address"),
			@Result(property="detailAddress", column="detailAddress"),
			@Result(property="password", column="password"),
			@Result(property="bankInfo", column="bankInfo"),
			@Result(property="receiveType", column="receiveType"),
			@Result(property="infoPath", column="infoPath"),
			@Result(property="regDate", column="regDate"),
			@Result(property="chgDate", column="chgDate"),
			@Result(property="status", column="status")
			})
	List<Orders> selectAll();
	
	//주문서 조회 
	@Select("select * from orders where orderNo=#{orderNo} and status<>4")
	@Results(value= {
			@Result(property="orderNo", column="orderNo"),
			@Result(property="member", column="member",one=@One(select="com.stone.springmvc.member.dataservice.I회원Mapper.findByNo")),
			@Result(property="name", column="name"),
			@Result(property="isAllergie", column="isAllergie"),
			@Result(property="allergieName", column="allergieName"),
			@Result(property="post", column="post"),
			@Result(property="address", column="address"),
			@Result(property="detailAddress", column="detailAddress"),
			@Result(property="password", column="password"),
			@Result(property="bankInfo", column="bankInfo"),
			@Result(property="receiveType", column="receiveType"),
			@Result(property="infoPath", column="infoPath"),
			@Result(property="regDate", column="regDate"),
			@Result(property="chgDate", column="chgDate"),
			@Result(property="status", column="status")
			})
	Orders select(int orderNo);

	//주문서 변경
	@Update("update orders set name=#{name}, isAllergie=#{isAllergie}, allergieName=#{allergieName}, "
			+ "post=#{post}, address=#{address}, detailAddress=#{detailAddress}, "
			+ "password=#{password}, bankInfo=#{bankInfo}, receiveType=#{receiveType}, infoPath=#{infoPath}, chgdate=sysdate() where orderNo=#{orderNo}")
	void update(Orders order);
	
	//주문서 취소
	@Delete("update orders set status=4 where orderNo=#{orderNo}")
	void delete(int orderNo);
}

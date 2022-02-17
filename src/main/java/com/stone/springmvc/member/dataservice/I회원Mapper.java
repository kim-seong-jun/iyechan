package com.stone.springmvc.member.dataservice;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.stone.springmvc.member.common.Member;

@Mapper
public interface I회원Mapper {

    @Select("select * from member where no=#{no}")
    @Results(value= {
			@Result(property="no",column="no"),
			@Result(property="id",column="id"),
			@Result(property="password",column="password"),
			@Result(property="name",column="name"),
            @Result(property="tel",column="tel"),
			@Result(property="email",column="email"),
			@Result(property="post",column="post"),
			@Result(property="address",column="address"),
			@Result(property="detailAddress",column="detailAddress")  } )
    Member findByNo(int no);
    
    @Select("select if(count(*)=1,1,0) from member where id=#{id}")
	boolean ID가있는가(String id);

	@Insert("insert into member(id,password,name,tel,email,post,address,detailaddress) values(#{id},#{password},#{name},#{tel},#{email},#{post},#{address},#{detailaddress})")
	void 회원정보저장하다(Member 새회원);
	
	@Select("select if(count(*)=1,1,0) from member where id=#{id} and password=#{password}")
	boolean 회원인가(String id,String password);
	
	@Select("select * from member where id=#{id} and password=#{password}")
	@Results(value= {
			@Result(property="no",column="no"),
			@Result(property="id",column="id"),
			@Result(property="password",column="password"),
			@Result(property="name",column="name"),
            @Result(property="tel",column="tel"),
			@Result(property="email",column="email"),
			@Result(property="post",column="post"),
			@Result(property="address",column="address"),
			@Result(property="detailAddress",column="detailAddress")  } )
	Member 찾다ID와PASSWORD(@Param("id")String id,@Param("password")String password);
}

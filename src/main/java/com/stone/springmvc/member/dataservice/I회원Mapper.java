package com.stone.springmvc.member.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.stone.springmvc.member.common.Member;

@Mapper
public interface I회원Mapper {

    //회원등록
	@Insert("insert into member(id,password,name,tel,email,post,address,detailAddress,status) values(#{id},#{password},#{name},#{tel},#{email},#{post},#{address},#{detailAddress},1)")
	void 회원정보저장하다(Member 새회원);
	
	//회원조회
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
			@Result(property="detailAddress",column="detailAddress"),
			@Result(property="status",column="status")} )
    Member findByNo(int no);
    
    //id가 존재하는지 조회
    @Select("select if(count(*)=1,1,0) from member where id=#{id}")
	boolean ID가있는가(String id);


	//id,password 일치여부 확인
	@Select("select if(count(*)=1,1,0) from member where id=#{id} and password=#{password}")
	boolean 회원인가(String id,String password);
	
	//id,password로 회원정보 조회
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
			@Result(property="detailAddress",column="detailAddress"),
			@Result(property="status",column="status")
			} )
	Member 찾다ID와PASSWORD(@Param("id")String id,@Param("password")String password);
	
	//회원목록 찾기
	@Select("select * from member")
	@Results(value= {
			@Result(property="no",column="no"),
			@Result(property="id",column="id"),
			@Result(property="password",column="password"),
			@Result(property="name",column="name"),
            @Result(property="tel",column="tel"),
			@Result(property="email",column="email"),
			@Result(property="post",column="post"),
			@Result(property="address",column="address"),
			@Result(property="detailAddress",column="detailAddress"),
			@Result(property="status",column="status")
		})
	List<Member> selectAll();
	
	//회원정보 수정
	@Update("update member set id=#{id}, "
			+ "password=#{password}, "
			+ "name=#{name}, "
			+ "tel=#{tel}, "
			+ "email=#{email}, "
			+ "post=#{post}, "
			+ "address=#{address}, "
			+ "detailAddress=#{detailAddress}, "
			+ "status=#{status}, "
			+ "where no=#{no}")
	void updateMember(Member member);
	
	//회원상태 변경(탈퇴포함)
	@Update("update member set status=#{status} where no=#{no}")
	void memberStatus(@Param("status")int status ,@Param("no")int no);
	
	//회원 삭제
	@Delete("delete from member where no=#{no}")
	void deleteMember(int no);
}

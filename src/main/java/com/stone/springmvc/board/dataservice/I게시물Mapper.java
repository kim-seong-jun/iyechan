package com.stone.springmvc.board.dataservice;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.stone.springmvc.board.common.Board;

@Mapper
public interface I게시물Mapper {
	            
	//게시물 등록
	@Insert("insert into board(title,contents,writer,regdate) values(#{title},#{contents},#{writer.no},sysdate())")
	void save(Board board);
	
	//게시물목록 찾기
	@Select("select * from board")
	@Results(value= {
		@Result(property="no", column="no"),
		@Result(property="title", column="title"),
		@Result(property="contents", column="contents"),
		@Result(property="writer", column="writer",one=@One(select="com.stone.springmvc.member.dataservice.I회원Mapper.findByNo")),
		@Result(property="regdate", column="regdate"),
		@Result(property="chgdate", column="chgdate"),
		@Result(property="views", column="views")
		})
	List<Board> selectAll();
	
	//페이지별 게시물목록
	//전체게시물수
	@Select("select count(*) from board")
	int selectCount();
	
	//페이지별 게시물목록 찾기
	@Select("select * from board order by no desc limit #{from},#{max}")
	@Results(value= {
		@Result(property="no", column="no"),
		@Result(property="title", column="title"),
		@Result(property="writer", column="writer",one=@One(select="com.stone.springmvc.member.dataservice.I회원Mapper.findByNo")),
		@Result(property="regdate", column="regdate"),
		@Result(property="chgdate", column="chgdate"),
		@Result(property="views", column="views")
		})
	List<Board> selectByPage(@Param("from") int from, @Param("max") int max);
	
	//게시물 상세조회
	//조회수 증가
	@Update("update board set views=views+1 where no=#{no}")
	void updateViews(int no);
	//게시물 찾기
	@Select("select * from board where no=#{no}")
	@Results(value= {
			@Result(property="no", column="no"),
			@Result(property="title", column="title"),
			@Result(property="contents", column="contents"),
			@Result(property="writer", column="writer",one=@One(select="com.stone.springmvc.member.dataservice.I회원Mapper.findByNo")),
			@Result(property="regdate", column="regdate"),
			@Result(property="chgdate", column="chgdate"),
			@Result(property="views", column="views")
			})
	Board selectByNo(int no);

	//게시물 변경
	@Update("update board set title=#{title}, contents=#{contents}, chgdate=sysdate() where no=#{no}")
	void updateBoard(Board board);
	
	//게시물 삭제
	@Delete("delete from board where no=#{no}")
	void deleteBoard(int no);
}

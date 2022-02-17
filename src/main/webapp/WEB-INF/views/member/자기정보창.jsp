<%@page import="com.stone.springmvc.member.common.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/style_userInfo.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="menu" class="menu_contents" style="text-align : center;">
<a href="/boards/1">[게시물목록]</a>
</div>
   <div class="board_tistory">
	    <fieldset>
	      <legend class="screen_out">자기정보창</legend>
	      <div class="box_board">
	        <div class="inp_text">
	          <label for="userNo"  class="screen_out" >no</label>
	          <input type="text" id="userNo" name="no" value="${member.no}">
	        </div>
	        <div class="inp_text">
	          <label for="userName" class="screen_out" >name</label>
	          <input type="text" id="userName" name="name" value="${member.name}">
	        </div>
	        <div class="inp_text">
	          <label for="userId" class="screen_out" >id</label>
	          <input type="text" id="userId" name="id" value="${member.id}">
	        </div>
	        <div class="inp_text">
	          <label for="userPassword" class="screen_out" >password</label>
	          <input type="text" id="userPassword" name="password" value="${member.password}">
	        </div>
	      </div>
	    </fieldset>
	</div>
</body>
</html>
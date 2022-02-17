<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% boolean isLogin=(boolean)request.getAttribute("isLogin");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>믿고 먹이는 우리 아이반찬 아이예찬</title>
<link href="/css/style_list.css" rel="stylesheet" type="text/css" />	 
</head>
<body>
<div id="mainWrapper">
	<div id="menu">
		<a href="/boards/1">[게시물목록]</a>
		<%if(isLogin){ %>
			<a href="/logOut">[로그아웃]</a>
			<a href="/member">[자신의 정보]</a>
			<a href="/board">[새글쓰기]</a>
		<%}else{ %>
			<a href="/login">[로그인]</a>
		<%} %>
	</div>
	<div id="img_title">
		<img src="/img/img_title.jpg" width="476" height="236" /><br>
	</div>
	<div id="img_main" >
		<img src="/img/img_main.jpg" width="826" height="540" /><br>
	</div>
	<div id="footer">
	<p>고객센터 전화번호 080-456-9898<br>
	경기도 고양시 권율대로 671 아이예찬 대표이사 김성준
	</div>
</div>
</body>
</html>
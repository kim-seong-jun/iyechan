<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="/css/style_login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="inner_login">
	<!-- <div id="menu" class="menu_contents" style="text-align : center;">
	<a href="/boards/1">[게시물목록]</a>
	</div> -->
    <div class="login_tistory">
	 <form action="/login" method="post">
	    <fieldset>
	      <legend class="screen_out">로그인 정보 입력폼</legend>
	      <div class="box_login">
	        <div class="inp_text">
	          <label for="loginId" class="screen_out">아이디</label>
	          <input type="text" id="loginId" name="id" placeholder="ID" >
	        </div>
	        <div class="inp_text">
	          <label for="loginPw" class="screen_out">비밀번호</label>
	          <input type="password" id="loginPw" name="password" placeholder="Password" >
	        </div>
	      </div>
      	<button type="button" class="btn_login">회원등록</button>
      	<button type="submit" class="btn_login">로그인</button>
	    </fieldset>
	  </form>
	</div>
</div>
</body>
</html>



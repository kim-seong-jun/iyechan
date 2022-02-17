<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/style_write.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="inner_board">
	<div id="menu" class="menu_contents" style="text-align : center;">
	<a href="/boards">[게시물목록]</a>
	</div>
    <div class="board_tistory">
	 <form action="/board" method="post">
	    <fieldset>
	      <legend class="screen_out">게시글 입력폼</legend>
	      <div class="box_board">
	        <div class="inp_text">
	          <label for="boardTitle" class="screen_out">제목</label>
	          <input type="text" id="boardTitle" name="title" placeholder="제목" >
	        </div>
	        <div class="inp_text">
	          <label for="boardContent" class="screen_out">내용</label>
	          <textarea cols="60" rows="10" id="boardContent" name="contents" placeholder="내용"></textarea>
	        </div>
	      </div>
      	<button type="submit" class="btn_board">등록</button>
	    </fieldset>
	  </form>
	</div>
</div>
</body>
</html>
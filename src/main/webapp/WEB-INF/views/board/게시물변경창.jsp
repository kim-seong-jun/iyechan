<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.stone.springmvc.board.common.*" %>    
<%
    Board board=(Board)request.getAttribute("board");
    Boolean isWriter=(Boolean)request.getAttribute("isWriter");
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/style_write.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="menu" class="menu_contents" style="text-align : center;">
	<a href="/boards">[목록]</a>
	</div>
	
    <div class="board_tistory">
	 <form action="/update" method="post">
		<fieldset>
	      <legend class="screen_out">게시글 입력폼</legend>
	      <div class="box_board">
	        <div class="inp_text" id="title_text">
	          <label for="boardTitle" class="screen_out" >제목</label>
	          <input type="text" id="boardTitle" name="title" value="<%=board.getTitle() %>">
	        </div>
	        <div class="inp_text">
	          <label for="boardContent" class="screen_out">내용</label>
	          <textarea cols="60" rows="10" id="boardContent" name="contents" ><%=board.getContents() %></textarea>
	        </div>
	        <div class="inp_text">
	          <label for="boardWriter" class="screen_out" >적성자</label>
	          <input type="text" id="boardWriter" name="title" value="${board.writer.name}">
	        </div>
	        <div class="inp_text">
	          <label for="boardViews" class="screen_out" >조회수</label>
	          <input type="text" id="boardViews" name="title" value="${board.views}">
	        </div>
	      </div>
      	<button type="submit" class="btn_board">변경</button>
	    </fieldset>
	          <input type="hidden" name ="no" value="${board.no }"/><br>
	  </form>
	</div>
</body>
</html>
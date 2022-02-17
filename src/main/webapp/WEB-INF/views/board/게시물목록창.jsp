<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.stone.springmvc.board.common.*" %>
<%
	List<Board> boards = (List<Board>)request.getAttribute("boards");
	int 현제페이지번호=(int)request.getAttribute("pageNo");
	int 마지막페이지번호=(int)request.getAttribute("lastPageNo");
	int 블럭당최대페이지수=5;
	int 블럭시작페이지번호=현제페이지번호-(현제페이지번호-1)%블럭당최대페이지수;
	int 예상블럭끝페이지번호=블럭시작페이지번호+(블럭당최대페이지수-1);
	int 블럭끝페이지번호=(예상블럭끝페이지번호<=마지막페이지번호)?예상블럭끝페이지번호:마지막페이지번호;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/style_list.css" rel="stylesheet" type="text/css" />	
</head>
<body>
<div id="mainWrapper">
	<div id="menu" class="menu_contents" style="text-align : center;">
	<a href="/main">[메인]</a>
	<a href="/board">[새글쓰기]</a>
	</div>
	<div id="img_title">
		<img src="/img/small_log.jpg" width="473" height="219" /><br>
	</div>
        <ul>
            <!-- 게시판 제목 -->
            <li>
            	의견 게시판
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>작성일</li>
                            <li>작성자</li>
                            <li>조회수</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
                    <% for(int 일련번호=0;일련번호<boards.size();일련번호++){ 
					Board 게시물 =boards.get(일련번호);//zero base %>
                    <li>
                        <ul>
                            <li><%=일련번호+1 %></li>
                            <li class="left"><a href="/board/<%=게시물.getNo()%>"><%= 게시물.getTitle() %></a></li>
                            <li><%=게시물.getRegdate()%></li>
                            <li><%=게시물.getWriter().getName() %> </li>
                            <li><%=게시물.getViews()%> </li>
                        </ul>
                    </li>
                    <%} %>
                </ul>
            </li>

            <!-- 게시판 페이징 영역 -->
            <li>
				<div id="divPaging">
	                <%	if(블럭시작페이지번호 > 1){	%>
						<div><a href="/boards/<%=블럭시작페이지번호-1%>"> ◀ </a></div>			
					<%	}	%>
					<% 
					for(int 페이지번호=블럭시작페이지번호; 페이지번호<=블럭끝페이지번호; 페이지번호++){ 
						String 출력페이지번호=(페이지번호==현제페이지번호)?"["+페이지번호+"]":" "+페이지번호;
					%>
						<div><a href="/boards/<%=페이지번호%>"><%= 출력페이지번호 %></a></div>
					<%} %>
					<%	if(블럭끝페이지번호 < 마지막페이지번호){	%>
						<div><a href="/boards/<%=블럭끝페이지번호+1%>"> ▶ </a></div>		
					<%	}	%>
				</div>                
            </li>

            <!-- 검색 폼 영역 -->
            <li id='liSearchOption'>
                <div>
                    <select id='selSearchOption' >
                        <option value='A'>제목+내용</option>
                        <option value='T'>제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input id='txtKeyWord' />
                    <input type='button' value='검색'/>
                </div>
			</li>
        </ul>
</div>    
</body>
</html>
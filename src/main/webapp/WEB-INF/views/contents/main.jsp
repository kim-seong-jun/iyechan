<%@page import="com.stone.springmvc.member.common.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.stone.springmvc.board.common.*" %>
<% 
	boolean isLogin=(boolean)request.getAttribute("isLogin");
%>
<!DOCTYPE html>
<html>
<head>
  <title>아이예찬 </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- include libraries(jQuery, bootstrap) -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 -->  
 
 
 
  <!-- include summernote css/js-->
  <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
  <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>  
  
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
  <link href="/css/style_main.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="/js/main.js"></script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">아이예찬</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">HOME</a></li>
        <li><a href="#brand">BRAND</a></li>
        <li><a href="#menu">MENU</a></li>
        <li><a href="#board">BOARD</a></li>
        <li><a href="#contact">CONTACT</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MY MENU
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
          	<%if(isLogin){ %>
            <li><a href="/logOut">LOGOUT</a></li>
            <li><a href="#infoModal" id="myinfo" data-toggle="modal">MY INFO</a></li>
            <li><a href="#ordersModal" id="orders" data-toggle="modal">ORDERS</a></li>
            <%}else{ %>
          	<li><a href="#loginModal"  id="login" data-toggle="modal">LOGIN</a></li>
          	<%} %>
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/img/main_01.jpg" alt="main_01" width="1200" height="460">
      </div>
      <div class="item">
        <img src="/img/main_02.jpg" alt="main_02" width="1200" height="460">
      </div>
      <div class="item">
        <img src="/img/main_03.jpg" alt="main_03" width="1200" height="460">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>



<!-- Container (The brand Section) -->
<div id="brand" class="container text-center">
  <h3>BRAND</h3>
  <p><em>아이예찬에 오신것을 환영합니다!</em></p><br>
  <p>직접 재료 선정부터 조리, 포장까지 아이들만의 특성에 맞추어</p> 
  <p>깨끗하고 저염으로 조리하기 때문에</p>
  <p>온식구가 함께 먹을 수 있는 반찬입니다.</p><br>
  <p>매주 수요일 문앞에 배달해 드립니다.</p>
  <p>모든 식재료는 신선함을 지키기 위해 조리 전날 구입하며,</p>
  <p>조리 및 배달까지 당일진행을 합니다.</p>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>국내산 식재료</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="/img/brand_01.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>국내산 식재료만을 사용합니다.</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>청결한 저염식</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="/img/brand_02.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>저염식으로 조리합니다.</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>당일 조리 배송</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="/img/brand_03.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>당일 조리한 음식을 배송 합니다.</p>
      </div>
    </div>
  </div>
</div>

<!-- Container (MENU Section) -->
<div id="menu" class="bg-1">
  <div class="container">
    <h3 class="text-center">MENU</h3>
    <p class="text-center">이번주 메뉴를 공개합니다.<br><em>제철의 신선한 재료로 정성껏 준비한 메뉴입니다.<br>많은 관심 부탁드립니다.</em></p>
       
	<div class="row text-center">
	  <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/img/menu_01.jpg" width="400" height="300" style="cursor:pointer" onclick="window.open('/img/menu_01.jpg','scrollbars=yes','width=879,height=2179');"> 
          <p><strong>앙념소불고기</strong></p>
        </div>
      </div>
	  <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/img/menu_02.jpg" width="400" height="300" style="cursor:pointer" onclick="window.open('/img/menu_02.jpg','scrollbars=yes','width=879,height=2179');"> 
          <p><strong>설렁탕</strong></p>
        </div>
      </div>
	  <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/img/menu_03.jpg" width="400" height="300" style="cursor:pointer" onclick="window.open('/img/menu_03.jpg','scrollbars=yes','width=879,height=2179');"> 
          <p><strong>한돈제육볶음</strong></p>
        </div>
      </div>
	  <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/img/menu_04.jpg" width="400" height="300" style="cursor:pointer" onclick="window.open('/img/menu_04.jpg','scrollbars=yes','width=879,height=2179');"> 
          <p><strong>소고기육전</strong></p>
        </div>
      </div>
	  <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/img/menu_05.jpg" width="400" height="300" style="cursor:pointer" onclick="window.open('/img/menu_05.jpg','scrollbars=yes','width=879,height=2179');"> 
          <p><strong>밑반찬4종</strong></p>
        </div>
      </div>
	</div>
    <%if(isLogin){ %>
    <div class="row">
	  <div class="col-sm-12">
	          <button class="btn pull-right" data-toggle="modal" data-target="#myModal">주문하기</button>
	  </div>
    </div>
    <%} %>
  </div>
</div>

<!-- Container (The board Section) -->
<div id="board" class="container">
  <h3 class="text-center">BOARD</h3>
  <!-- 페이지 목록 갯수   -->
  <div class="row" >
	<select id="listSize" class="col-xs-2 pull-right">
		<option value="10">10 개씩</option>
		<option value="15">15 개씩</option>
		<option value="20">20 개씩</option>
	</select>
  </div>  
  <table class="table table-hover">
    <thead>
      <tr>
	      <th class="col-sm-1">No</th>
	      <th class="col-sm-6">제목</th>
	      <th class="col-sm-2">작성자</th>
	      <th class="col-sm-2">작성일</th>
	      <th class="col-sm-1">조회수</th>
      </tr>
    </thead>
    
	<!-- 게시물이 출력될 영역 -->
	<tbody id="boardData"></tbody>
	
  </table>
	
  <!-- pagination{s} -->
  <div class="text-center">	
	<div class="pagination">
		<ul id="pageNo" class="pagination">

		</ul>
	</div>
  </div>
  <!-- pagination{e} -->	

    <%if(isLogin){ %>
    <div class="row">
	  <div class="col-sm-12">
		<button class="btn pull-right" data-toggle="modal" data-target="#boardModal" id="btn_bWrite">글쓰기</button>
	  </div>
    </div>
    <%} %>
  
</div>  

<!-- Container (Contact Section) -->
<div id="contact" class="bg-2">
  <div class="container">
	  <h3 class="text-center">CONTACT</h3>
	<!--   <p class="text-center"><em>게시판에 문의사항이나 의견을 남겨주세요.</em></p> -->
	  
	  <div class="row">
	    <div class="col-md-4">
	      <h3>연락처</h3>
	      <p><span class="glyphicon glyphicon-map-marker"></span>&nbsp;경기도 고양시 권율대로 671 아이예찬</p>
	      <p><span class="glyphicon glyphicon-phone"></span>&nbsp;Phone: +00 1515151515</p>
	      <p><span class="glyphicon glyphicon-envelope"></span>&nbsp;Email: mail@mail.com</p>
	    </div>
	    <div class="col-md-8">	
			<div id="daumRoughmapContainer1645752477223" class="root_daum_roughmap root_daum_roughmap_landing"  style='width:100%'></div>
			<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1645752477223",
					"key" : "29azb",
					"mapHeight" : "180"
				}).render();
			</script>
		</div>
	   </div>		
	
	<!-- Container (Friends Section) -->  
	  <br><br><h3 class="text-center">FRIENDS</h3>  
	  <ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home">아이예찬</a></li>
	    <li><a data-toggle="tab" href="#menu1">아기밥그릇 본점</a></li>
	    <li><a data-toggle="tab" href="#menu2">아기밥 그릇 김포/계양</a></li>
	    <li><a data-toggle="tab" href="#menu3">아기밥그릇 양천/마포</a></li>
	  </ul>
	
	  <div class="tab-content">
	    <div id="home" class="tab-pane fade in active">
	      <p><a href="https://cafe.naver.com/iyechan" target='_blank'>의정부 아기반찬 '아이예찬'</a></p>
	    </div>
	    <div id="menu1" class="tab-pane fade in active">
	      <p><a href="https://cafe.naver.com/babybowl" target='_blank'>행복한 윤서맘의 맛있는 아기반찬. 강서본점</a></p>
	    </div>
	    <div id="menu2" class="tab-pane fade">
	      <p><a href="https://cafe.naver.com/babybowlgimpo" target='_blank'>행복한 준우서우맘의 맛있는 아기반찬</a></p>
	    </div>
	    <div id="menu3" class="tab-pane fade">
	      <p><a href="https://cafe.naver.com/babybowlyc" target='_blank'>아이를 생각하는 엄마의 마음으로 만드는 아기반찬</a></p>
	    </div>
	  </div>
	</div>
</div>

<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>고객센터 전화번호    080-456-7890<br>경기도 고양시 권율대로 671 아이예찬   대표이사 김성준</p> 
</footer>
<jsp:include page="../include/modal.jsp"/>

</body>
</html>

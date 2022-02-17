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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href="/css/style_main.css" rel="stylesheet" type="text/css" />	
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
          	<li><a href="/login">LOGIN</a></li>
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
    <div class="row">
	  <div class="col-sm-12">
	          <button class="btn pull-right" data-toggle="modal" data-target="#myModal">주문하기</button>
	  </div>
    </div>
  </div>
  
  <!-- Modal 주문서작성-->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-file"></span> 주문서 작성</h4>
        </div>
        <div class="modal-body">
          <form role="form" action="/order" method="post">
            <div class="form-group">
              <label for="name"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;아이이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="ex)김성준">
            </div>
            <div class="form-group">
              <label for="isAllergie"><span class="glyphicon glyphicon-ban-circle"></span>&nbsp;&nbsp;&nbsp;알러지유무/종류</label>&nbsp;&nbsp;&nbsp;
				<label class="radio-inline">
					<input type="radio" id="isAllergieT" name="isAllergie" value="true" onchange="setDisplay()">있음
				</label>
				<label class="radio-inline">
					<input type="radio" id="isAllergieF" name="isAllergie" value="false" onchange="setDisplay()" checked>없음
				</label>
              <input type="text" class="form-control" id="allergieName" name="allergieName" placeholder="ex)견과류" >
            </div>
            <div class="form-group">
              <label for="post"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;&nbsp;배송지</label><br>
              <label for="post">&nbsp;&nbsp;&nbsp;우편번호</label>&nbsp;&nbsp;&nbsp;
              <input type="text" class="form-control" id="post" name="post" placeholder="ex)10563">
            </div>
            <div class="form-group">
              <label class="" for="address">&nbsp;&nbsp;&nbsp;주소</label>
              <input type="text" class="form-control" id="address" name="address" placeholder="ex)경기도 고양시 덕양구 권율대로671">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="ex)0000동 0000호">
            </div>
            <div class="form-group">
              <label for="password"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;공동현관 비밀번호</label>
              <input type="text" class="form-control" id="password" name="password" placeholder="ex)1001 누르고  1234#">
            </div>
            <div class="form-group">
              <label for="bankInfo"><span class="glyphicon glyphicon-euro"></span>&nbsp;&nbsp;&nbsp;입금정보(입금일/입금주/입금금액)</label>
              <input type="text" class="form-control" id="bankInfo" name="bankInfo" placeholder="ex)2/6일  김성준 150000">
            </div>
            <div class="form-group">
              <label for="receiveType"><span class="glyphicon glyphicon-download-alt"></span>&nbsp;&nbsp;&nbsp;수령방법</label>
              <input type="text" class="form-control" id="receiveType" name="receiveType" placeholder="ex)직배송">
            </div>
            <div class="form-group">
              <label for="infoPath"><span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;&nbsp;아이예찬을 알게된곳?</label>
              <input type="text" class="form-control" id="infoPath" name="infoPath" placeholder="ex)민락신도시카페">
            </div>
              <button type="submit" class="btn btn-block">주문 
                <span class="glyphicon glyphicon-ok"></span>
              </button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span>&nbsp;&nbsp;&nbsp;취소
          </button>
          <p><a href="#">도움말</a></p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="alert alert-primary" role="alert">
  A simple primary alert with <a href="#" class="alert-link">an example link</a>. Give it a click if you like.
</div>

<!-- Container (The board Section) -->
<div id="board" class="container">
  <h3 class="text-center">BOARD</h3>
  <p>의견 게시판</p>  
  <table class="table table-hover">
    <thead>
      <tr>
	      <th>No</th>
	      <th>제목</th>
	      <th>작성일</th>
	      <th>작성자</th>
	      <th>조회수</th>
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
  
	<!-- search{s} -->
<!-- 	<div class="form-group row justify-content-center">

		<div class="w100" style="padding-right: 10px">
			<select class="form-control form-control-sm" id="keywordType">
				<option value="testTitle">제목</option>
				<option value="testContent">본문</option>
				<option value="testName">작성자</option>
			</select>
		</div>

		<div class="w300" style="padding-right: 10px">
			<input type="text" class="form-control form-control-sm"
				name="keyword" id="keyword">
		</div>

		<div>
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="btnSearch">검색</button>
		</div>
	</div> -->
	<!-- search{e} -->
	
		<!-- 페이지 목록 갯수   -->
		<div class="form-group row justify-content-center" style="display:none">
			<p>게시판 목록 갯수</p>
			<div class="w100" style="padding-right: 10px">
				<select id="listSize" class="form-control form-control-sm">
					<option value="10">10 개</option>
					<option value="15">15 개</option>
					<option value="20">20 개</option>
				</select>
			</div>
		</div>
  
</div>  

<!-- Container (Contact Section) -->
<div id="contact" class="container">
  <h3 class="text-center">CONTACT</h3>
  <p class="text-center"><em>게시판에 문의사항이나 의견을 남겨주세요.</em></p>
  <div class="row">
    <div class="col-md-4">
      <h3>연락처</h3>
      <p><span class="glyphicon glyphicon-map-marker"></span>&nbsp;경기도 고양시 권율대로 671 아이예찬</p>
      <p><span class="glyphicon glyphicon-phone"></span>&nbsp;Phone: +00 1515151515</p>
      <p><span class="glyphicon glyphicon-envelope"></span>&nbsp;Email: mail@mail.com</p>
    </div>
    
    <div class="col-md-8">
    	<form action="/board" method="post">
	      <div class="row">
	        <div class="col-sm-6 form-group">
	          <input class="form-control" id="title" name="title" placeholder="제목" type="text" required>
	        </div>
	      </div>
	      <textarea class="form-control" id="contents" name="contents" placeholder="내용" rows="5"></textarea>
	      <br>
	      <div class="row">
	        <div class="col-md-12 form-group">
	          <button class="btn pull-right" type="submit">등록</button>
	        </div>
	      </div>
        </form>
    </div>
  </div>		
    

<!-- Container (Friends Section) -->  
  <h3 class="text-center">FRIENDS</h3>  
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

<!-- Modal - myInfo -->
<div class="container">
  <div class="modal fade" id="infoModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-info-sign"></span>내정보</h4>
        </div>
        <div class="modal-body" id="myinfoData">

        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal">
            <span class="glyphicon glyphicon-ok-sign"></span>&nbsp;&nbsp;&nbsp;확인
          </button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal - orders -->
<div class="container">
  <div class="modal fade" id="ordersModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4><span class="glyphicon glyphicon-file"></span>주문내역</h4>
        </div>
        <div class="modal-body">        
          <table class="table table-hover">
		    <thead>
		      <tr>
			      <th>주문번호</th>
			      <th>회원이름</th>
			      <th>아이이름</th>
			      <th>주문일자</th>
			      <th>상태</th>
		      </tr>
		    </thead>
    
			<!-- 게시물이 출력될 영역 -->
			<tbody id="ordersData"></tbody>
	
		 </table>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-right" data-dismiss="modal">
            <span class="glyphicon glyphicon-ok-sign"></span>&nbsp;&nbsp;&nbsp;확인
          </button>
        </div>
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

<script>
$(document).ready(function(){ 
  
  getBoardData();	
	
  //알러지 상세 - 숨기기를 기본값
  $('#allergieName').hide();
  
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
})

//알레르기 유무에 따라 상세내용입력란 보여주기
function setDisplay(){
    if($('input:radio[id=isAllergieT]').is(':checked')){
        $('#allergieName').show();
    }else{
        $('#allergieName').hide();
        $('#allergieName').val('');
    }
}

//주문서 데이터 요청
$("#orders").click(function(){
	let memberNo = 
	$.ajax({
		url :"/orders",
		type:"POST",
		contentType:"application/json",	//서버로 보내는 컨텐츠가 jason임을 표시
		dataType:"json",
		success : function(res) {
			const orderList = res;
		
			var data = "";
			// 테이블의 row를 삽입하는 부분
			for (var i = 0; i < orderList.length; i++) {
				data += "<tr>"; 
				data += "<td>" + orderList[i].orderNo + "</td>";
				data += "<td>" + orderList[i].member.name + "</td>";
				data += "<td>" + orderList[i].name + "</td>";
				const d = new Date(orderList[i].regDate);
				data += "<td>" + d.toLocaleDateString() + "</td>";
				data += "<td>" + getStatus(orderList[i].status) + "</td>";
				data += "</tr>";
			}
			
			$("#ordersData").html(data);
		}
	})

})

function getStatus(status) {
	switch (status) {
	  case 0: return "임시저장";
	  case 1: return "주문저장";
	  case 2: return "배송준비";
	  case 3: return "배송중";
	  case 4: return "배송완료";
	  case 5: return "취소";
	  default:
	    return "" 
	}
}

//내정보 요청
$("#myinfo").click(function(){
	$.ajax({
		url :"/member",
		type:"POST",
		contentType:"application/json",	//서버로 보내는 컨텐츠가 jason임을 표시
		dataType:"json",
		success : function(res) {
			const member = res;

			var data = "";
			
			data += member.id;
			data += member.name;
			data += member.name;
			data += member.tel;
			data += member.email;
			data += member.post;
			data += member.address;
			data += member.detailAddress;
			
			$("#myinfoData").html(data);
		}
	})
})

//게시판 목록 요청
function getBoardData(page) {
// 	var search = $("#searchInput").val();
	let listSize = $("#listSize").val();
	let pageInfo={page:page, listSize:listSize}
	$
			.ajax({
				url :"/boards", 				//서비스 주소
				type:"POST",
				contentType:"application/json",	//서버로 보내는 컨텐츠가 jason임을 표시
				data : JSON.stringify(pageInfo),
				dataType:"json",
				success : function(res) {
					const resData = res;
					
					let boards = resData.boardList;
					let 현제페이지번호 = resData.pageNo;
					let 마지막페이지번호 = resData.lastPageNo;
					let 블럭당최대페이지수=listSize;
					let 블럭시작페이지번호=현제페이지번호-(현제페이지번호-1)%블럭당최대페이지수;
					let 예상블럭끝페이지번호=블럭시작페이지번호+(블럭당최대페이지수-1);
					let 블럭끝페이지번호=(예상블럭끝페이지번호<=마지막페이지번호)?예상블럭끝페이지번호:마지막페이지번호;
					
					var data = "";
					var block = "";

					//테이블의 row를 삽입
					for (var i = 0; i < boards.length; i++) {
						data += "<tr>"; 
						data += "<td>" + (i+1) + "</td>";
						data += "<td>" + boards[i].title + "</td>";
						const d = new Date(boards[i].regdate);
 						data += "<td>" + d.toLocaleDateString() + "</td>";
						data += "<td>" + boards[i].writer.name + "</td>";
						data += "<td>" + boards[i].views + "</td>";
						data += "</tr>";
					}
					//페이지 표시					
					if(블럭시작페이지번호 > 1){
						block += "<li><a href='javascript:getBoardData(" + 블럭시작페이지번호-1+ ")'>◀ </a></li>"			
					}
					for(var 페이지번호=블럭시작페이지번호; 페이지번호<=블럭끝페이지번호; 페이지번호++){ 
						var 출력페이지번호=(페이지번호==현제페이지번호)?"["+페이지번호+"]":" "+페이지번호;
						block += "<li><a href='javascript:getBoardData("+ 페이지번호 + ")'>" + 출력페이지번호 + "</a></li>"
					}
					if(블럭끝페이지번호 < 마지막페이지번호){	
						block += "<li><a href='javascript:getBoardData(" + 블럭끝페이지번호+1 + ")'> ▶ </a></li>"		
					}	

					$("#boardData").html(data);
					$("#pageNo").html(block);
				}
			})
}



<%-- 
<div class="row">
<label class="col-sm-3" for="id">&nbsp;&nbsp;&nbsp;ID</label>
<input class="col-sm-9" type="text" id="id" name="id" value="<%=member.getId() %>" disabled>
</div>
<div class="row">
<label class="col-sm-3" for="password">&nbsp;&nbsp;&nbsp;PASSWORD</label>
<input class="col-sm-9" type="text" id="password" name="password" value="<%=member.getPassword() %>" disabled>
</div>
<div class="row">
<label class="col-sm-3" for="name">&nbsp;&nbsp;&nbsp;이름</label>
<input class="col-sm-9" type="text" id="name" name="name" value="<%=member.getName() %>" disabled>
</div>
<div class="row">
<label class="col-sm-3" for="tel">&nbsp;&nbsp;&nbsp;전화번호</label>
<input class="col-sm-9" type="text" id="tel" name="tel" value="<%=member.getTel() %>" disabled>
</div>
<div class="row">
<label class="col-sm-3" for="email">&nbsp;&nbsp;&nbsp;e-mail</label>
<input class="col-sm-9" type="text" id="email" name="email" value="<%=member.getEmail() %>" disabled>
</div>
<div class="row">
<label class="col-sm-3" for="post">&nbsp;&nbsp;&nbsp;우편번호</label>
<input class="col-sm-9" type="text" id="post" name="post" value="<%=member.getPost() %>" disabled>
</div>
<div class="row">
<label class="col-sm-3" for="address">&nbsp;&nbsp;&nbsp;주소</label>
<input class="col-sm-9" type="text" id="address" name="address" value="<%=member.getAddress() %>" disabled>
</div>
<div class="row">
  <label class="col-sm-3" for="detailAddress"></label>
<input class="col-sm-9" type="text" id="detailAddress" name="detailAddress" value="<%=member.getDetailAddress() %>" disabled>
</div>
 --%>
 
</script>

</body>
</html>

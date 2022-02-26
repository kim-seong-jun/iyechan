$(document).ready(function(){ 
  
	//Board --------------------------------------------------------------
	
	//board- selectAll
	getBoardData();
	
	
	
	var action ='';
	var url = '';
	var type = '';
	
	//글쓰기 버튼 글릭시 text 초기화
	$("#btn_bWrite").click(function(){
		$("#bModal_title").text("게시물 등록");
		$("#board_title").val('');
		$("#summernote").val('');
		var btnSec = "";
		btnSec += "<button onclick='insertBoard()' type='button' id='board-btn' class='btn btn-block-inline'>" 
		btnSec += "<span class='glyphicon glyphicon-ok'></span>&nbsp;&nbsp;등록"
		btnSec += "</button>"
		$("#boardBtnSec").html(btnSec);
	})

	//Orders --------------------------------------------------------------
	//주문목록 데이터 조회 요청
	$("#orders").click(function(){
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
					data += "<td><a href=''#' class='btn-primary btn-xs'>수정</a>&nbsp"
					data += "<a href='/deleteOrder/" + orderList[i].orderNo + "' class='btn-primary btn-xs'>삭제</a></td>"
					data += "</tr>";
				}
				
				$("#ordersData").html(data);
			}
		})
	
	})	
	
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
				data += "<tr>" + member.id + "</tr>";;
				data += "<tr>" + member.name + "</tr>";;
				data += "<tr>" + member.name + "</tr>";;
				data += "<tr>" + member.tel + "</tr>";;
				data += "<tr>" + member.email + "</tr>";;
				data += "<tr>" + member.post + "</tr>";;
				data += "<tr>" + member.address + "</tr>";;
				data += "<tr>" + member.detailAddress + "</tr>";;
				
				$("#myinfoData").html(data);
			}
		})
	})	
	
	//Member --------------------------------------------------------------
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
				data += "<tr>" + member.id + "</tr>";;
				data += "<tr>" + member.name + "</tr>";;
				data += "<tr>" + member.name + "</tr>";;
				data += "<tr>" + member.tel + "</tr>";;
				data += "<tr>" + member.email + "</tr>";;
				data += "<tr>" + member.post + "</tr>";;
				data += "<tr>" + member.address + "</tr>";;
				data += "<tr>" + member.detailAddress + "</tr>";;
				
				$("#myinfoData").html(data);
			}
		})
	})	
	
	//Login --------------------------------------------------------------
	
	//로그인 요청
	$("#login-btn").click(function(){
		$.ajax({
			url :"/login",
			type:"POST",
			data: { "id" : $('#id').val(), 
				"password" : $('#password').val() },
			success : function(res) {
				if(res==='success')	{
					alert('로그인 했습니다.')
					location.reload();	
				}else{
					alert('로그인 정보가 올바르지 않습니다.');	
				}}
		})
	})		
	
   //게시판 개수 변경		
	$("#listSize").change(function() {
		getBoardData();
	});
		
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
}) //End $(document).ready(function()


function insertBoard() {
	let title = $("#board_title").val();
	let contents = $("#summernote").val();
	let boardInfo={title:title, contents:contents};
	$.ajax({
		url :"/board",
		type:"POST",
		contentType:"application/json",	
		data : JSON.stringify(boardInfo),
		success : function(res) {
			if(res==='success')	{
				alert('게시물을 등록하였습니다.')
				location.reload();
			}else if(res==='reqLogin'){
				alert('로그인후 작성해 주세요.');	
			}
			else{
				alert('게시물등록에 실패하였습니다.');	
			}}
	})	
}

//게시판 목록 요청
function getBoardData(page) {
// 	var search = $("#searchInput").val();
	let listSize = $("#listSize").val();
	let pageInfo={page:page, listSize:listSize}
	$.ajax({
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
			data += "<td><a href='javascript:detailBoard(" + boards[i].no + ")'>"+ boards[i].title + "</a></td>";
			//data += "<td><a href='#' id='boardList_title'>"+ boards[i].title + "</a></td>";
			data += "<td>" + boards[i].writer.name + "</td>";
			const d = new Date(boards[i].regdate);
			data += "<td>" + d.toLocaleDateString() + "</td>";
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

//게시물 상세보기
function detailBoard(no) {
	$.ajax({
		url :"/board/"+no,
		type:"get",
		data: { "no" : no},
		dataType:"json",
		success : function(res) {
			let board = res;
			$("#bModal_title").text("게시물 상세");
			$("#board_title").val(board.title);
			$("#summernote").val(board.contents);
			$("#board_no").val(board.no);
			
			var btnSec = "";
			btnSec += "<button onclick='updateBoard()' type='button' id='board-btn' class='btn btn-block-inline'>" 
			btnSec += "<span class='glyphicon glyphicon-ok'></span>&nbsp;&nbsp;수정"
			btnSec += "</button>"
			btnSec += "<button onclick='deleteBoard("+ board.no +")' type='button' id='board-btn' class='btn btn-block-inline'>" 
			btnSec += "<span class='glyphicon glyphicon-ok'></span>&nbsp;&nbsp;삭제"
			btnSec += "</button>"
			$("#boardBtnSec").html(btnSec);
			
			$("#boardModal").modal();
		}
	})
}


function updateBoard() {
	let no = $("#board_no").val();
	let title = $("#board_title").val();
	let contents = $("#summernote").val();
	let boardInfo={no:no, title:title, contents:contents};
	$.ajax({
		url :"/updateBoard",
		type:"POST",
		contentType:"application/json",	
		data : JSON.stringify(boardInfo),
		success : function(res) {
			if(res==='success')	{
				alert('게시물을 수정했습니다.')
				location.reload();
			}else{
				alert('게시물등록에 실패하였습니다.');	
			}}
	})	
}

function deleteBoard(no) {
	$.ajax({
		url :"/deleteBoard/"+no,
		type:"get",
		data: { "no" : no},
		success : function(res) {
			if(res==='success') {
				alert('삭제 하였습니다.');
				location.reload();
			} else {
				alert('처리 실패 하였습니다.');
			};
		}
	})
}

//알레르기 유무에 따라 상세내용입력란 보여주기
function setDisplay(){
    if($('input:radio[id=isAllergieT]').is(':checked')){
        $('#allergieName').show();
    }else{
        $('#allergieName').hide();
        $('#allergieName').val('');
    }
}

//주문서 작성 - 우편번호조회
function findPost(){
	  new daum.Postcode({
        oncomplete: function(data) {
       		document.querySelector("#post").value=data.zonecode;
       		document.querySelector("#address").value=data.roadAddress;
       		document.querySelector("#detailAddress").focus();
        }
    }).open();
}

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





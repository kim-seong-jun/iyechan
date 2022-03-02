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
	//주문서등록
	$("#order-btn").click(function(){
		let name 			= $("#name").val();			//아이이름
		let isAllergie		= $("#isAllergie").val();	//알레르기유무
		let allergieName	= $("#allergieName").val();	//알레르기상세
		let post 			= $("#post").val();			//우편번호
		let address 		= $("#address").val();		//주소
		let detailAddress 	= $("#detailAddress").val();//상세주소
		let password 		= $("#password").val();		//현관비밀번호
		let bankInfo 		= $("#bankInfo").val();		//입금정보
		let receiveType 	= $("#receiveType").val();	//수령방법
		let infoPath 		= $("#infoPath").val();		//알게된 경로
		let orderInfo={name:name, isAllergie:isAllergie,allergieName:allergieName,
		post:post,address:address,detailAddress:detailAddress,password:password,
		bankInfo:bankInfo,receiveType:receiveType,infoPath:infoPath};
		$.ajax({
			url :"/order",
			type:"POST",
			contentType:"application/json",	
			data : JSON.stringify(orderInfo),
			success : function(res) {
				if(res==='success')	{
					alert('주문서를 등록하였습니다.')
					location.reload();
				}else{
					alert('주문서 등록에 실패하였습니다.');	
				}
			}
		})	
	})

	
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
					const s = orderList[i].status;
					data += "<td>" + getStatus(s) + "</td>";
					if(s !==5) {
						data += "<td><a href='javascript:deleteOrders(" + orderList[i].orderNo + ")' class='btn-primary btn-xs'>주문취소</a></td>"
					}
					data += "</tr>";
				}
				
				$("#ordersData").html(data);
			}
		})
	
	})	
	
	//Member --------------------------------------------------------------
	
	//내정보 요청
	$("#myinfo").click(function(){
		$.ajax({
			url :"/myinfo",
			type:"POST",
			contentType:"application/json",	//서버로 보내는 컨텐츠가 jason임을 표시
			dataType:"json",
			success : function(res) {
				const member = res;
				var data = "";
				data += "<table class='table table-hover'>"
				data += "<tr><td>ID</td><td>" + member.id + "</td></tr>";
				data += "<tr><td>PASSWORD</td><td>" + member.password + "</td></tr>";
				data += "<tr><td>이름</td><td>" + member.name + "</td></tr>";
				data += "<tr><td>TEL</td><td>" + member.tel + "</td></tr>";
				data += "<tr><td>Email</td><td>" + member.email + "</td></tr>";
				data += "<tr><td>우편번호</td><td>" + member.post + "</td></tr>";
				data += "<tr><td>주소</td><td>" + member.address + "</td></tr>";
				data += "<tr><td>상세주소</td><td>" + member.detailAddress + "</td></tr>";
				data += "</table>";
				
				$("#myinfoData").html(data);
			}
		})
	})		
	
	//모달창 닫기
	$("#btn_cMember").click(function(){
		$('#loginModal').modal("hide");
	})
	$("#btn_uMember").click(function(){
		$('#infoModal').modal("hide");
	})
	
	//회원등록
	$("#member_Cbtn").click(function(){
		if(회원등록하다()!==true){
			return '';	
		}
		let id				= $("#member_id").val();			//아이디
		let password 		= $("#member_password").val();		//비밀번호
		let name 			= $("#member_name").val();			//이름
		let tel 			= $("#member_tel").val();			//전화번호
		let email 			= $("#member_email").val();		//email
		let post 			= $("#member_post").val();			//우편번호
		let address 		= $("#member_address").val();		//주소
		let detailAddress 	= $("#member_detailAddress").val();//상세주소
		let status 			= 1;						//상태
		let memberInfo={id:id, password:password, name:name, tel:tel, email:email,
		post:post,address:address,detailAddress:detailAddress,status:status};
		$.ajax({
			url :"/insertMember",
			type:"POST",
			contentType:"application/json",	
			data : JSON.stringify(memberInfo),
			success : function(res) {
				if(res==='success')	{
					alert('회원을 등록하였습니다.')
					location.reload();
				}else{
					alert('회원등록에 실패하였습니다.');	
				}
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
			const resData = res;
			let board = resData.board;
			let isWriter = resData.isWriter;
			$("#bModal_title").text("게시물 상세");
			$("#board_title").val(board.title);
			$("#summernote").val(board.contents);
			$("#board_no").val(board.no);
			
			if(isWriter===true){
				var btnSec = "";
				btnSec += "<button onclick='updateBoard()' type='button' id='board-btn' class='btn btn-block-inline'>" 
				btnSec += "<span class='glyphicon glyphicon-ok'></span>&nbsp;&nbsp;수정"
				btnSec += "</button>"
				btnSec += "<button onclick='deleteBoard("+ board.no +")' type='button' id='board-btn' class='btn btn-block-inline'>" 
				btnSec += "<span class='glyphicon glyphicon-ok'></span>&nbsp;&nbsp;삭제"
				btnSec += "</button>"
				$("#boardBtnSec").html(btnSec);
			}
			
			$("#boardModal").modal();
		}
	})
}

//게시물 수정
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

//게시물 삭제
function deleteBoard(no) {
	if(confirm('삭제하시겠습니까?')){
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
}


//Orders --------------------------------------------------------------
//주문서 취소
function deleteOrders(no) {
	if(confirm('주문취소 하시겠습니끼?')){
		$.ajax({
			url :"/deleteOrder/"+no,
			type:"get",
			data: { "no" : no},
			success : function(res) {
				if(res==='success') {
					alert('주문 취소하였습니다.');
					location.reload();
				} else {
					alert('처리 실패 하였습니다.');
				};
			}
		})
	}
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

//회원등록 관련
//우편번호조회
function findPost_member(){
	  new daum.Postcode({
        oncomplete: function(data) {
       		document.querySelector("#member_post").value=data.zonecode;
       		document.querySelector("#member_address").value=data.roadAddress;
       		document.querySelector("#member_detailAddress").focus();
        }
    }).open();
}
function id를중복검사하다(){
	document.querySelector("#member_id").value="";
	window.open("/id","","width=500,height=300");
}
function id를받다(id){
	document.querySelector("#member_id").value=id;
}
function 회원등록하다(){
	let 성명=document.querySelector("#member_name").value;
	if(성명.trim()==""){
		alert("성명은 필수입력입니다.");
		return false;
	}
	let id=document.querySelector("#member_id").value;
	if(id.trim()==""){
		alert("아이디는 필수입력입니다.");
		return false;
	}
	let tel=document.querySelector("#member_tel").value;
	if(tel.trim()==""){
		alert("전화번호는 필수입력입니다.");
		return false;
	}
	let password=document.querySelector("#member_password").value;
	if(password.trim()==""){
		alert("패스워드는 필수입력입니다.");
		return false;
	}
	let password2=document.querySelector("#member_password2").value;
	if(password2.trim()==""){
		alert("패스워드는 다시 입력되야 합니다.");
		return false;
	}
	if(password!=password2){
		alert("패스워드는 동일해야 합니다.");
		return false;
	}
	let email1 = document.querySelector("#member_email1").value;
	let email2 = document.querySelector("#member_email2").value;
	let email = document.querySelector("#member_email");
	email.value=email1+"@"+email2;
	return true;
}



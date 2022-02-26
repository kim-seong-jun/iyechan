<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script>
  $(document).ready(function() {
	    $('#summernote').summernote({
	            height: 300,                 // set editor height
	            minHeight: null,             // set minimum height of editor
	            maxHeight: null,             // set maximum height of editor
	            focus: true                  // set focus to editable area after initializing summernote
	    });
	});
  </script>
<title>Insert title here</title>
</head>
<body>
<div class="container" >  
<!-- Board ------------------>	
	<!-- Modal 게시물창 : 등록/수정 모두 사용-->
	<div class="container">  
	  <div class="modal fade" id="boardModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h4 id="bModal_title"><span class="glyphicon glyphicon-file" ></span></h4>
	        </div>
	        <div class="modal-body">
	        	<label for="id">제목</label>
	            <input type="text" class="form-control" name="title" id="board_title">
				<textarea name="contents" id="summernote"></textarea>	        
			</div>
			<div class="modal-footer" id="boardBtnSec">              
				<!-- 수행버튼이 들어갈 영역 -->
	        </div>
	        <div style="display:none;"><input type="text" id="board_no"></div>
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- Order ------------------>
	<!-- Modal - 주문서작성 -->
	<div class="container">
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h4><span class="glyphicon glyphicon-file"></span> 주문서 작성</h4>
	        </div>
	        <div class="modal-body">
	            <div class="row">
	              <label for="name"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;아이이름</label>
	              <input type="text" class="form-control" id="name" name="name" placeholder="ex)김성준">
	            </div>
	            <div class="row">
	              	<label for="isAllergie"><span class="glyphicon glyphicon-ban-circle"></span>&nbsp;&nbsp;&nbsp;알러지유무/종류</label>&nbsp;&nbsp;&nbsp;
					<label class="radio-inline">
						<input type="radio" id="isAllergieT" name="isAllergie" value="true" onchange="setDisplay()">있음
					</label>
					<label class="radio-inline">
						<input type="radio" id="isAllergieF" name="isAllergie" value="false" onchange="setDisplay()" checked>없음
					</label>
	              <input type="text" class="form-control" id="allergieName" name="allergieName" placeholder="ex)견과류" >
	            </div>
	            <div class="row">
	              <label for="post"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;&nbsp;배송지</label><br>
	            </div>
	            <div class="row">
	              <input type="text" class="form-control-inline" id="post" name="post" readonly>
	              <button type="button" onclick="findPost()" class="btn-primary btn-xs">주소검색</button>
	            </div>
				<div class="row">              
	              <input type="text" class="form-control" id="address" name="address" readonly >
	            </div>
	            <div class="row">
	              <input type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="상세주소를 입력해주세요." >
	            </div>
	            <div class="row">
	              <label for="password"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;공동현관 비밀번호</label>
	              <input type="text" class="form-control" id="pw" name="password" placeholder="ex)1001 누르고  1234#">
	            </div>
	            <div class="row">
	              <label for="bankInfo"><span class="glyphicon glyphicon-euro"></span>&nbsp;&nbsp;&nbsp;입금정보(입금일/입금주/입금금액)</label>
	              <input type="text" class="form-control" id="bankInfo" name="bankInfo" placeholder="ex)2/6일  김성준 150000">
	            </div>
	            <div class="row">
	              <label for="receiveType"><span class="glyphicon glyphicon-download-alt"></span>&nbsp;&nbsp;&nbsp;수령방법</label>
	              <input type="text" class="form-control" id="receiveType" name="receiveType" placeholder="ex)직배송">
	            </div>
	            <div class="row">
	              <label for="infoPath"><span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;&nbsp;아이예찬을 알게된곳?</label>
	              <input type="text" class="form-control" id="infoPath" name="infoPath" placeholder="ex)민락신도시카페">
	            </div>
	        </div>
	        <div class="modal-footer">
	        	<button type="button" id="order-btn" class="btn btn-block">주문 
                <span class="glyphicon glyphicon-ok"></span>
              	</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
		<!-- Modal 주문목록조회-->  
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
				      <th></th>
			      </tr>
			    </thead>
	    
				<!-- 주문내역이 출력될 영역 -->
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

<!-- Member ------------------>
	<!-- Modal - 내정보 보기 -->
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

<!-- Login ------------------>
	<!-- Modal 로그인-->
	<div class="container">  
	  <div class="modal fade" id="loginModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h4><span class="glyphicon glyphicon-file"></span> 로그인</h4>
	        </div>
	        <div class="modal-body">
	              <label for="id">ID</label>
	              <input type="text" class="form-control" id="id" name="id">
	              <label for="password">PASSWORD</label>
	              <input type="password" class="form-control" id="password" name="password">
	        </div>
			<div class="modal-footer">              
	              <button type="button" class="btn btn-block">회원등록 
	                <span class="glyphicon glyphicon-ok"></span>
	              </button>
	              <button type="button" id="login-btn" class="btn btn-block">로그인 
	                <span class="glyphicon glyphicon-ok"></span>
	              </button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
</div>  
</body>
</html>
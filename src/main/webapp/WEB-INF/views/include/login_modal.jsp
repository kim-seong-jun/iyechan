<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Modal - 내정보 보기 -->
	<div class="container">
	  <div class="modal fade" id="memberRModal" role="dialog">
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

</body>
</html>
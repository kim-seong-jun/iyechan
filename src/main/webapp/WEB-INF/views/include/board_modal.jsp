<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
  <script>
  $(document).ready(function() {
	  $('#summernoteR').summernote();
	  $('#summernoteR').summernote({
	            height: 600,                 // set editor height
	            minHeight: null,             // set minimum height of editor
	            maxHeight: null,             // set maximum height of editor
	            focus: true                  // set focus to editable area after initializing summernote
	  });
	});
  </script>
</head>
<body>

	<!-- Modal 게시물작성-->
	<div class="container">  
	  <div class="modal fade" id="boardCModal" role="dialog">
	    <div class="modal-dialog">
	    
	      Modal content
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h4><span class="glyphicon glyphicon-file"></span>게시물 작성</h4>
	        </div>
	        <div class="modal-body">
	        	<label for="id">제목</label>
	            <input type="text" class="form-control" id="title" name="title">
				<textarea name="contents" id="summernote"></textarea>	        
			</div>
			<div class="modal-footer">              
              <button onclick="insertBoard()" type="button" id="board-btn" class="btn btn-block">등록 
                <span class="glyphicon glyphicon-ok"></span>
              </button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal 게시물상세조회-->
	<div class="container">  
	  <div class="modal fade" id="boardRModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h4><span class="glyphicon glyphicon-file"></span>게시물 조회</h4>
	        </div>
	        <div class="modal-body">
	        	<label for="id">제목</label>
	            <input type="text" class="form-control" id="title" name="title">
				<textarea name="contentsR" id="summernoteR"></textarea> 
				<textarea name="contentsR" id="summernoteR1"></textarea> 
			</div>
			<div class="modal-footer">              
              <button onclick="insertBoard()" type="button" id="board-btn" class="btn btn-block">등록 
                <span class="glyphicon glyphicon-ok"></span>
              </button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>
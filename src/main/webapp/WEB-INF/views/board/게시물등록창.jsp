<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<script>
function 등록하다(){
	alert( $('#summernote').val());
	return false;
}
</script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link href="/css/style_write.css" rel="stylesheet" type="text/css" />
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mainWrapper">
	<div id="menu">
		<a href="/main">[메인]</a>
	</div>
	<div id="img_title">
		<img src="/img/small_log.jpg" width="473" height="219" /><br>
	</div>
	<div id="form_board">
		<form action="/board" method="post">
			<label>제목</label>
			<input type="text" id="boardTitle" name="title">
			<textarea name="contents" id="summernote"></textarea>
			<button type="submit" class="btn_board">등록</button>
		</form>
	</div>
</div>	
</body>
</html>

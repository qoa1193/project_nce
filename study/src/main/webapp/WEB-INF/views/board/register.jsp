<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
</head>
<body>

<form class="container" method="post" enctype="multipart/form-data">
<h1>게시판</h1>
	<div class="form-group">
	  <label>제목</label>
	  <input type="text" class="form-control" name="title" >
	</div>
	<div class="form-group">
	  <label>내용</label>
	  <textarea id="summernote" class="form-control" name="contents" rows="10">${board.contents}</textarea>
	</div>
	<div class="form-group">
		<input type="file" name="fileList" class="form-control">
		<input type="file" name="fileList" class="form-control">
		<input type="file" name="fileList" class="form-control">
	</div>
	<button class="btn btn-outline-success">등록</button>
	<a href="<%=request.getContextPath()%>/board${type}/list"><button type="button" class="btn btn-outline-danger">목록</button></a>
</form>
<script type="text/javascript">
	$(function(){
		$('form').submit(function(){
			return true;
		})
		$('#summernote').summernote({
	        placeholder: '내용을 입력하세요.',
	        tabsize: 2,
	        height: 400
	 	});
	})
</script>
</body>
</html>

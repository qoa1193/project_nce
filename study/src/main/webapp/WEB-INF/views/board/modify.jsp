<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>

<form class="container" enctype="multipart/form-data" method="post">
<h1>게시판</h1>
	<div class="form-group">
	  <label>제목</label>
	  <input type="text" class="form-control" name="title" value="${board.title}" >
	</div>
	<div class="form-group">
	  <label>작성자</label>
	  <input type="text" class="form-control" name="writer" readonly value="${board.writer}">
	</div>
	<div class="form-group">
	  <label>내용</label>
	  <textarea id="summernote" class="form-control" name="contents" rows="10">${board.contents}</textarea>
	</div>
	<div class="form-group file-box">
	  <label>첨부파일</label>
	  <c:forEach items="${fList}" var="file">
		<div class="form-control mb-2">
		  <span>${file.ori_name}</span> 
		  <i class="fas fa-times"></i>
		  <input type="hidden" value="${file.num}" name="fileNumList">
	  	</div>
	  </c:forEach>
	  <c:forEach begin="1" end="${3 - fList.size()}">
		<input type="file" class="form-control" name="fileList">  		  
	  </c:forEach>
	</div>
	<input type="hidden" name="num" value="${board.num}">
	<button class="btn btn-outline-success">등록</button>
	<a href="<%=request.getContextPath()%>/board${type}/list"><button type="button" class="btn btn-outline-danger">목록</button></a>
</form>
	<script type="text/javascript">
	 $(function(){
		 $('.file-box .fa-times').click(function(){
			 $(this).parent().remove();
			 var str =  '<input type="file" class="form-control" name="fileList">';
			 $('.file-box').append(str);
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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
	<title>게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/f7b209ccbb.js" crossorigin="anonymous"></script>
<style type="text/css">
.recommend-btn{
	font-size : 30px;
}
.fa-thumbs-down{
	transform :rotateY(180deg);
}
</style>
</head>
<body>

<div class="container">
<h1>게시판</h1>
	<div class="form-group">
	  <label>제목</label>
	  <input type="text" class="form-control" name="title" value="<c:out value="${board.title}"/>" readonly>
	</div>
	<div class="form-group">
	  <label>작성자</label>
	  <input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
	</div>
	<div class="form-group">
	  <label>작성일</label>
	  <input type="text" class="form-control" name="registered" value="${board.dateTime}" readonly>
	</div>
	<div class="form-group">
	  <label>조회수</label>
	  <input type="text" class="form-control" name="views" value="${board.views}" readonly>
	</div>
	<div class="form-group">
		<a href="#" class="recommend-btn up"><i class="far fa-thumbs-up"></i></a>
		<a href="#" class="recommend-btn down"><i class="far fa-thumbs-down"></i></a>
	</div>
	<div class="form-group">
	  <label>내용</label>
	  <div class="form-control" style="min-height : 400px;">${board.contents}</div>
	</div>
	<div class="form-group">
  	    <label>첨부파일</label>
		<c:forEach items="${fileList}" var="file">
		  <a href="<%=request.getContextPath()%>/board/download?fileName=${file.name}" class="form-control">${file.ori_name}</a>  
	  	</c:forEach>
	</div>	
	<div class="input-group">
		<a href="<%=request.getContextPath()%>/board/list" class="mr-2"><button class="btn btn-outline-danger">목록</button></a>
		<c:if test="${board != null && user.id == board.writer}">
			<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}" class="mr-2">
				<button class="btn btn-outline-danger">수정</button>
			</a>
			<form action="<%=request.getContextPath()%>/board/delete" method="post" class="mr-2">
				<input type="hidden" value="${board.num}" name="num">
				<button class="btn btn-outline-danger">삭제</button>
			</form>
		</c:if>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		var msg = '${msg}';
		printMsg(msg);
		history.replaceState({},null,null);
		

		
	})
	function printMsg(msg){
		if(msg=null ||msg = '' || history.state){
			return;
		}
		alert(msg);
	}
	$(function(){
		$('.recommend-btn').click(function(e){
			e.preventDefault;
		})
	})
</script>
</body>
</html>

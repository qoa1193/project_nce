<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html> <!--  html파일 표준을 의미 -->
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
  <form class="container" method="post" action="<%=request.getContextPath()%>/board/modify" enctype="multipart/form-data">
	<h2>게시글 수정</h2>
	<div class="form-group">
	  <label>제목</label>
	  <input type="text" class="form-control" name="title" value="${board.title}">
	</div>
	<div class="form-group">
	  <label>작성자</label>
	  <input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
	</div>
	<div class="form-group">
	  <label>내용</label>
	  <textarea id="summernote" name="contents">${board.contents}</textarea>
	</div>
		<div class="form-group files">
		  <label>첨부파일</label>
		  <c:forEach items="${fileList}" var="file">
			  <div class="form-control attach">
			  	<span>${file.ori_name}</span><button type="button" class="del-btn">X</button>
			  	<input type="hidden" name="fileNum" value="${file.num}">
			  </div> 	  	
		  </c:forEach>
		  <c:if test="${fileList == null || fileList.size()<3}">
		  	<input type="file" class="form-control" name="file" data=""/>
		  </c:if>
		</div>
	<input type="hidden" value="${board.num}" name="num"> <!-- 안보이게 넘겨줌 -->
	<input type="hidden" value="${board.num}" name="views">
	<button type="submit" class="btn btn-outline-success">등록</button>	 
  </form>
  <script type="text/javascript">
  	$(function(){
  		$('.del-btn').click(function(){
  			var str = '<input type="file" class="form-control" name="file"data="">';
  			$(this).parent().remove();
  			if($('.attach').length == 2)
	  			$('.files').append(str)
  		})
  		$(document).on('change','input[name=file]',function(){
		   var val = $(this).val();
		   var str =  '<input type="file" class="form-control" name="file" data=""/>';
		   var length = $('input[name=file]').length + $('.attach').length;
		   var data = $(this).attr('data');
		   //
		   if(val == ''){
				$(this).remove();
				if(length == 3 && $('input[name=file]').last().val() != ''){
			 		$('.files').append(str);				   
				}
		   }
		   //input 태그를 추가해야 하는 경우
		   else{
			 if( length < 3 && data == ''){
				 $('.files').append(str);
			 }  
			 $(this).attr('data', val);
		   }
		})
		  $('#summernote').summernote({
		        placeholder: 'Hello Bootstrap 4',
		        tabsize: 2,
		        height: 400
		  });
  	})
  </script>
</body>
</html>

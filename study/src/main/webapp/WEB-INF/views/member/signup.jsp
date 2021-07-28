<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html> 
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.min.js"></script>
<style>
	.error{
	color : red;
	}
</style>
</head>
<body>

<form class="container" method="post" action="<%=request.getContextPath()%>/member/signup">
	<h1>회원가입</h1>
	<div class="form-group">
	  <label>아이디</label>
	  <input type="text" class="form-control" name="id">
	</div>
	<button type="button" class="id-dup-btn btn btn-outline-success col-12">아이디 중복 검사</button>
	<div class="form-group">
	  <label>비밀번호</label>
	  <input type="password" class="form-control" name="pw" id="pw">
	</div>
	<div class="form-group">
	  <label>비밀번호확인</label>
	  <input type="password" class="form-control" name="pw2">
	</div>
	<div class="form-group">
	  <label>이름</label>
	  <input type="text" class="form-control" name="name">
	</div>
	<div class="form-group">
	  <label>이메일</label>
	  <input type="text" class="form-control" name="email">
	</div>
	<div class="form-group">
	  <label>성별</label>
	  <select class="form-control" name="gender">
	  	<option value="M">남성</option>
	  	<option value="F">여성</option>
	  </select>
	</div>	
	<button class="btn btn-outline-success col-12">회원가입</button>
</form>
<script type="text/javascript">
$(function(){
    $("form").validate({
        rules: {
            id: {
                required : true,
                regex : /^[a-z0-9_-]{5,20}$/
            },
            pw: {
                required : true,
                regex : /^[a-z0-9!@#]{8,16}$/i
                //regex: /^(?=\w{8,20}$)\w*(\d[A-z]|[A-z]\d)\w*$/
            },
            pw2: {
                required : true,
                equalTo : pw
            },
            name: {
                required : true
            },            
            email: {
                required : true,            
                email : true
            }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
            id: {
                required : "필수 정보입니다.",
                regex : '5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.'
            },
            pw: {
            	required : "필수 정보입니다.",
                regex : '8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.'
            },
            pw2: {
            	required : "필수 정보입니다.",          
                equalTo : "비밀번호가 일치하지 않습니다."
            },
            name: {
            	required : "필수 정보입니다."
            },            
            email: {
            	required : "필수 정보입니다.",               
                email : "메일규칙에 어긋납니다"
            }         
        }
    });
    $('.id-dup-btn').click(function(){
    	//console.log('ttt');
    	var id = $('[name=id]').val();
    	var res = memberService.idCheck(contextPath, id);
    	if(res)
    		alert('사용 가능한 아이디 입니다.');
    	else
    		alert('이미 가입된 아이디 입니다.');
    })
})
$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
);
var contextPath = '<%=request.getContextPath()%>';
var memberService =(function(){
	function idCheck(contextPath, id){
		var flag = false;
		$.ajax({
			async : false, //동기화 시켜서 끝날때까지 기다렸다가 실행하도록
    		type : 'post',
    		url : contextPath + '/id/check',
    		data : {id : id},
    		success : function(res){
    			//console.log(res);
    			if(res == 'OK'){
    				flag = true;
    			}else{
    				flag = false;
    			}
    		}
    	})
    	return flag;
	}
	return{
		name : 'memberService',
		idCheck : idCheck
	}
})();
</script>

</body>
</html>

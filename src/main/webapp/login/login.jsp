<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<%@ include file="/common/basicLib.jsp" %>
<script type="text/javascript">
function getCookie(cookieName){
	var cookies = document.cookie.split("; ");
	
	var cookieValue = "";
	for(var i=0; i<cookies.length; i++){
		// cookie값의 시작부분 = indexOf
		var str = cookies[i];
		if(str.startsWith(cookieName + "=")){
			var str = cookies[i]
			// 끝부분(lastIndexOf)은 미포함이기때문에 +1을 붙힌다
			cookieValue = str.substring((cookieName + "=").length);
		}
	}
	return cookieValue;
}

$(document).ready(function(){
	// remember 쿠키값이 Y이면
	if(getCookie("remember") == "Y"){
		// remember-me 체크박스 체크
		// userId input value를 userId 쿠키 값으로 설정
		$("#remember-me").attr("checked", true);
		// $("#remember-me").prop("checked", true);
		$("#userId").val(getCookie("userId"));
	}
	if(getCookie("remember") == "Y"){
		document.getElementById("remember-me").checked = true;
	}
});
</script>
</head>

<body>
<div class="container">
	<form action="/dditLogin" method="post" class="form-signin">
		<h2 class="form-signin-heading">Please sign in</h2>
		<label for="inputEmail" class="sr-only">Email address</label>	
		<input type="text" name="userId" id ="userId" class="form-control" placeholder="Email address" required="required" autofocus="autofocus"/>
		<label for="inputPassword" class="sr-only">Password</label>
		<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="required" value="brownpass"/>
		<div class="checkbox">
			<label>
				<input type="checkbox" id="remember-me" name="remember-me" value="remember-me"> 사용자 아이디 기억하기
			</label>
	    </div>
	    <!--
	    	remember-me(사용자 아이디 기억하기)
	    	1. login.jsp
	    		remember-me input(checkbox) 파라미터를 login 요청시 전송
	    		(userId, pass → userId, pass, remember-me)
	    	
	    	2. /dditLogin(LoginServlet)
	    	remember-me 파라미터를 확인
	    	
	    	2-1) 아이디 기억하기 사용
	    		response 객체에 remember-me cookie 생성
	    	2-2) 아이디 기억하기 사용하지 않기
	    		response 객체에 remember-me cookie 삭제
	    	
	    	3. 쿠키 값에 따라 remember-me 값 checkbox 설정하기
	    		login.jsp
	    -->
		<input class="btn btn-lg btn-primary btn-block" type="submit" value="Sign in"/>	
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<!-- 파일 전송은 POST method만 가능!! -->
<!--
	get		/fileUpload : fileUpload.jsp 요청
	post	/fileUpload : form전송 처리
-->
<form action="/fileUpload" method="post" enctype="multipart/form-data">
	<input type="text" id="userId" name="userId" value="brown" /><br>
	<input type="file" id="profile" name="profile" value="" /><br>
	<input type="submit" value="전송" /><br>
	
	<%=application.getRealPath("/profile") %>
</form>
</body>
</html>
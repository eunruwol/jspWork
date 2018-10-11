<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>basic.jsp</title>
</head>
<!-- 스크립틀릿 :  안에 자바코드 작성 -->
<!-- 표현식 :  출력을 표현 -->
<%	String msg = "first jsp"; %>
<%	
	Date date = new Date();
	SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd hh:ss:mm");
	
%>
<body>

	Hello, world!
	<br> <%=simple.format(date)%>	
	
	<br/>--sessionTest--<br/>
	<%UserVo userVo = (UserVo)session.getAttribute("userVo"); %>	
	<%
	String name = userVo.getName();
	String alias = userVo.getAlias();
	%>
	
	<%=name %>[<%=alias %>] 님 안녕하세요
	
		
</body>
</html>
<!-- 일반적인 html 과 같은 요청 http://localhost:8081/basic.jsp -->
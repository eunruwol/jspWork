<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
</head>
<body>
	main.jsp <br/>
	userId : <%=request.getParameter("userId") %> <br/>
	password : <%=request.getParameter("password") %><br/><br/>
	
	--sessionTest--<br/>
	<%UserVo userVo = (UserVo)session.getAttribute("userVo"); %>	
	<%
	String name = userVo.getName();
	String alias = userVo.getAlias();
	%>
	
	<%=name %>[<%=alias %>] 님 안녕하세요
	
</body>
</html>
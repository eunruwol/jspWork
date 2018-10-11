<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>resultResult</title>
</head>
<body>
	requestResult.jsp
	
	<h3>parameter</h3>
	userId = <%=request.getParameter("userId") %><br/>
	name = <%=request.getParameter("name") %><br/><br/>
	
	<%
		//dispatch
		//UserVo userVo = (UserVo)request.getAttribute("userVo");
		//redirect
		UserVo userVo = (UserVo)session.getAttribute("userVo");
	%>
	
	userId : <%=userVo.getUserId() %> <br/>
	name :  <%=userVo.getName() %> <br/>
	alias : <%=userVo.getAlias() %> <br/>
	birth : <%=userVo.getBirth() %> <br/>
	
	
</body>
</html>
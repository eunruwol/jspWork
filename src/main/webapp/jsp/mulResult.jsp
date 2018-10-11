<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mulResult</title>
</head>
<body>
	
	계산된 숫자 : <%=session.getAttribute("mulResult") %>	<br/>
	계산과정 <br/>
	<% ArrayList<Double> result = (ArrayList)session.getAttribute("mulResultList"); 
		int counter = 0;	
	%>
	<% for(Double num : result){ %>
		<%=++counter + " : " %><%=num %><br/>
	<%	} %>
	
	
</body>
</html>
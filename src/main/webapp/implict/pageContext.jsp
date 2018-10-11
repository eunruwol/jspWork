<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pageContext</title>
</head>
<body>
	
<!-- 
	내장객체(implict) 
	request, response, session, applictaion, out
-->		

	out.equals(pageContext.getOut()) : 
		<b><%= out.equals(pageContext.getOut()) %>	</b><br/>
	request.equals(pageContext.getRequest()) : 
		<b><%= request.equals(pageContext.getRequest()) %> </b><br/>
	page.equals(pageContext.getResponse()) :
		<b><%= page.equals(pageContext.getPage()) %>	</b><br/>
	response.equals(pageContext.getResponse()) :
		<b><%= response.equals(pageContext.getResponse())%></b>	<br/>
	session.equals(pageContext.getSession()) :
		<b><%= session.equals(pageContext.getSession())%></b>	<br/>
	application.equals(pageContext.getServletContext()) : 
		<b><%= application.equals(pageContext.getServletContext()) %></b>	<br/>
	
	
</body>
</html>
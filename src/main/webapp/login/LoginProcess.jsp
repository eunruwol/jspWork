<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginProcess</title>
</head>
<body>
	
	<!-- 
		request 메서드
		getPrameter
		getParameterValue
		getParameterMap
		getParamterNames	
	 -->
	<% String[] userIdValues = request.getParameterValues("userId"); %>
	<% Map<String, String[]> reqMap = request.getParameterMap(); %>	
	<% Enumeration<String> parameterNames = request.getParameterNames(); %>	
	
	request.getParameter("userId")  : <%=request.getParameter("userId") %>	<br/>
	request.getParameterValues("userId")  : 
	<% 
		for(String str : userIdValues){
			out.print(str +"<br/>");
		}
	%>
	request.getParameter("password")  : <%=request.getParameter("password") %>	
	
	<h3>requestMap</h3>
	<%for(String str : reqMap.get("userId")){%>
		str : <%=str%><br/>		
		
	<%}%>	
	
	reqMap.get("password") : <%=reqMap.get("password") %>
	<br/>	
	<% while(parameterNames.hasMoreElements()) {
		String paramName = parameterNames.nextElement();
		out.print(paramName + ", ");
	}
	
	%>	
	
</body>
</html>







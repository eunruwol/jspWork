<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Content-Disposition", "attachment; filename=excel.xls");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>excel</title>
</head>
<body>
	
	<table>
		<tr>
			<td>UserId</td>	
			<td>Name</td>	
		</tr>	
		<tr>
			<td>김기동</td>	
			<td>IngBay Momston</td>	
		</tr>
		<tr>
			<td>잉베이 맘스턴</td>	
			<td>kim ki dong</td>	
		</tr>
	</table>		
	
	
</body>
</html>
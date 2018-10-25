<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{border-collapse:collapse;border:1px solid #ccc}
td{padding:5px}
</style>
</head>

<body>
<table border="1">
<c:forEach begin="1" end="9" var="i">
	<tr>
		<c:forEach begin="2" end="${param.number}" var="j">
			<td>${j} * ${i} = ${j*i}</td>
		</c:forEach>
	</tr>
</c:forEach>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body{font-family:"Nanum Gothic", sans-serif;}
h2{font-weight:100;}
.selects{width:300px;height:50px;font-size:20px;outline:none;transition:1s;}
</style>
</head>

<body>
<h2>logging tag</h2>
<tags:loggingTag></tags:loggingTag>
<c:forEach begin="1" end="10" var="i">
${i}<br>
</c:forEach>
<tags:loggingTag></tags:loggingTag>

<h2>color logging tag</h2>
<tags:colorLogging length="30" color="red"></tags:colorLogging>
<c:forEach begin="1" end="10" var="i">
${i}<br>
</c:forEach>
<tags:colorLogging color="red"></tags:colorLogging>

<h2>code</h2>
<tags:code code="P201"></tags:code>
<tags:code code="P301"></tags:code>
</body>
</html>
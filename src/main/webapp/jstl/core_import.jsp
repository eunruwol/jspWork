<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	JSTL 사용하기 위한 절차
	1. dependency 추가 (이미 했음)
	2. jsp 파일에서 지시자 추가(taglib : prefix, uri)
	3. prefix를 이용하여 jstl 태그 사용
--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<c:import url="timestablesjstl.jsp">
	<c:param name="number" value="5"></c:param>
</c:import>
<hr>
<!-- naver search -->
<c:import url="https://search.naver.com/search.naver?query=html5">
	<c:param name="query" value="html5"></c:param>
</c:import>
</body>
</html>
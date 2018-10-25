<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<c:set var="number" value="100000" scope="request"></c:set>
<c:set var="numberPercent" value="1" scope="request"></c:set>

<h2>기본 로케일</h2>
<fmt:formatNumber value="${number}" /><br>
<fmt:formatNumber value="${number}" type="currency" /><br>
<fmt:formatNumber value="${numberPercent}" type="percent" />

<h2>영문 로케일</h2>
<fmt:setLocale value="en_US" />
<fmt:formatNumber value="${number}" /><br>
<fmt:formatNumber value="${number}" type="currency" /><br>
<fmt:formatNumber value="${numberPercent}" type="percent" />

<h2>독일 로케일</h2>
<fmt:setLocale value="de_DE" />
<fmt:formatNumber value="${number}" /><br>
<fmt:formatNumber value="${number}" type="currency" /><br>
<fmt:formatNumber value="${numberPercent}" type="percent" />

<h2>문자열을 숫자형으로</h2>
<fmt:setLocale value="ko" />
<c:set var="parseNumber" value="1,000.99" />
<fmt:parseNumber value="${parseNumber}" />
</body>
</html>
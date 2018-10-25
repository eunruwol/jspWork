<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="length" type="Integer" required="false" %>
<%@ attribute name="color" type="String" required="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- length 속성이 없을 경우 20개가 나오도록 --%>
<c:set var="length" value="${length == null ? 20 : length}"></c:set>

<c:forEach begin="1" end="${length}" var="i">=</c:forEach>
	<c:if test="${length > 20}">
		<font color="${color}">logging</font>		
	</c:if>
	<c:if test="${length == 20}">
		<font color="${color}">length 20</font>
	</c:if>
<c:forEach begin="1" end="${length}" var="i">=</c:forEach>
<br>
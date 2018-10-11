<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scope</title>
</head>
<body>
	
	scope.jsp(값 전송) --> scopeServlet(각영역에 속성 저장 )<br/>
	--dispatch--> scopeResult.jsp(저장된 값 확인)<br/>
	

<form action="/scopeServlet" method="post">
	<input type="text" name="pageScope" value="james"/> <br/>
	<input type="text" name="requestScope" value="brown"/> <br/>
	<input type="text" name="sessionScope" value="sally"/> <br/>
	<input type="text" name="applicationScope" value="cony"/> <br/>
<input type="submit" value="전송"/>
</form>
</body>
</html>
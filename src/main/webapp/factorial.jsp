<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>factorial</title>
</head>
<body>
<%! 
//factorial method
public String msg(){
	return "hello, world";	
}

private int factorial(int num){
	int result = 0;	
	
	if(num == 1){
		result = 1;
	}else{
		result = num * factorial(num -1);
	}
	return result;	
	
}
%>

<%=msg() %>
<br>
<%for(int i = 1; i < 9; i++){ %>
	factorial(<% %>)결과값 : <%=factorial(i)%><br>
<%} %>

<!-- loop를 이용해서 여러번 출력 -->
</body>

</html>
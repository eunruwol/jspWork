<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
<link href="../css/bootstrap.min.css" rel="styleSheet">
<link href="../css/signin.css" rel="styleSheet" >

</head>

<body>


<!-- <form action="/login/LoginProcess.jsp" method="post"> -->

<div class="container">

<form action="/dditLogin" method="post" class="form-signin">
	<h2 class="form-signin-heading">Please sign in</h2>
	<label for="inputEmail" class="sr-only">Email address</label>	
	<input type="text" name="userId" id ="inputEmail" value="brown" class="form-control" placeholder="Email address" required="required" autofocus="autofocus"/>
	<label for=inputPassword class="sr-only">Password</label>
	<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required="required" value="brownpass"/> <br/>
	<input class="btn btn-lg btn-primary btn-block" type="submit" value="Sign in"/> 	
	
</form>


</div>

</body>
</html>
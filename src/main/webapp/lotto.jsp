<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<canvas id="myCanvas" width="200" height="200" style="border:1px solid #000;"></canvas>
<%
	Connection	conn	= null;
	Statement	stmt	= null;
	ResultSet	rs		= null;
	String 		ranText = "";
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url	= "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "pc18";
		String pass = "java";
		
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();

		int ranNo = (int)(Math.random()*18)+1;
		String sql ="SELECT * FROM JSPSTUDENT WHERE NO=" + ranNo;
		rs = stmt.executeQuery(sql);

		while(rs.next()){
			ranText = rs.getString("NAME");
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} finally {
		if(rs != null){
			try {
				rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(stmt != null){
			try {
				stmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
%>
<span id="ranText" hidden="hidden"><%=ranText%></span>
<script>
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
ctx.beginPath();
ctx.arc(100, 100, 100, 0, 2*Math.PI);
ctx.stroke();

ctx.font = "30px Arial";

var name = document.getElementById("ranText").innerText;
ctx.fillText(name, 55, 109);
</script>
</body>
</html>
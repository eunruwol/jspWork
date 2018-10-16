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
<style type="text/css">
.drawsvg,svg {width: 100%; height: 300px}
.stroke {stroke: #000; stroke-width: 1px; stroke-dasharray: 0 250; stroke-opacity: 1; fill: none; -webkit-animation: stroke_offset 8s infinite; animation: stroke_offset 8s infinite; -webkit-animation-timing-function: cubic-bezier(.25, .46, .45, .94); animation-timing-function: cubic-bezier(.25, .46, .45, .94) } @-webkit-keyframes stroke_offset { 100%, 25% {stroke-dasharray: 0 250; stroke-opacity: 1 } 50%, 75% {stroke-dasharray: 250 0; stroke-opacity: .75 } 55%, 70% {stroke-dasharray: 250 0; stroke-opacity: 0 } } @keyframes stroke_offset { 100%, 25% {stroke-dasharray: 0 250; stroke-opacity: 1 } 50%, 75% {stroke-dasharray: 250 0; stroke-opacity: .75 } 55%, 70% {stroke-dasharray: 250 0; stroke-opacity: 0 } } .fill { fill: #000; fill-opacity: 0; -webkit-animation: fill_offset 8s infinite; animation: fill_offset 8s infinite; -webkit-animation-timing-function: cubic-bezier(.25, .46, .45, .94); animation-timing-function: cubic-bezier(.25, .46, .45, .94) } @-webkit-keyframes fill_offset { 100%, 25%, 35%, 90% { fill-opacity: 0 } 50%, 70% { fill-opacity: 1 } } @keyframes fill_offset { 100%, 25%, 35%, 90% { fill-opacity: 0 } 50%, 70% { fill-opacity: 1 } } #fade-text {font-size: 4em};
</style>
</head>

<body>
<canvas  width="200" height="200" style="border:1px solid #000;"></canvas>
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

<div id="myCanvas" class="drawsvg">
	<svg version="1.1" viewBox="0 0 700 300">
		<symbol id="fade-text">
			<text x="45%" y="40%" text-anchor="middle"><%=ranText %></text>
		</symbol>
		<g>
			<use class="stroke" xlink:href="#fade-text"/>
			<use class="fill" xlink:href="#fade-text"/>
		</g>
	</svg>
</div>
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
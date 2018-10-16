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
<%
		Connection conn	= null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "pc18";
			String pass = "java";
			
			long startTime = System.currentTimeMillis();
			for(int i=0; i<30; i++){
				conn = DriverManager.getConnection(url, user, pass);
				if(i%5==0){
					out.println("schema : " + conn.getSchema() + "<br>");
				}else{
					out.println("schema : " + conn.getSchema() + "<br>");
				}
				
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			long endTime = System.currentTimeMillis();
			out.println("endTime - startTime : " + (endTime - startTime) + "ms");

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if(conn != null){
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
%>
</body>
</html>
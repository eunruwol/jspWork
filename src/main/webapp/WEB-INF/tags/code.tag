<%@tag import="java.sql.SQLException"%>
<%@tag import="java.sql.DriverManager"%>
<%@tag import="java.sql.ResultSet"%>
<%@tag import="java.sql.Statement"%>
<%@tag import="java.sql.Connection"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="code" type="String" required="true" %>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
		
	try {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "pc18";
		String pass = "java";
		
		conn = DriverManager.getConnection(url, user, pass);

		stmt = conn.createStatement();

		String sql ="SELECT PROD_LGU, PROD_NAME FROM PROD WHERE PROD_LGU='" + code + "'";
		rs = stmt.executeQuery(sql);
%>
		<select class="selects" name="prod">
<%		
			while(rs.next()){
%>
				<option value="<%=rs.getString("PROD_LGU")%>"><%=rs.getString("PROD_NAME")%></option>
<%
			}
%>
		</select>
<%		
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
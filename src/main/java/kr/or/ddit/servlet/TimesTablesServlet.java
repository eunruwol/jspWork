package kr.or.ddit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimesTablesServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2588873507349648963L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("	<head> ");
		pw.println("		<meta charset=\"UTF-8\"> ");
		pw.println("		<title>index</title> ");
		pw.println("	</head> ");
		pw.println("	<body id = \"body\"> ");
		pw.println("		<table border=\"1\">");
		
		for(int j = 1; j <= 9; j++){
			pw.println("			<tr>");
			
			for(int i = 2; i <= 9; i++){
				pw.println("				<td>"+ i + " *  " + j + " = " + (i * j) + "</td>");
			}
			
			pw.println("			</tr>");
		}
		
		pw.println("		</table>	");
		pw.println("	</body> ");
		pw.println("</html> ");
		
		
	}
	
}

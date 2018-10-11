package kr.or.ddit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 2687083486985995168L;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String[] paramUserIdArr = req.getParameterValues("userId");
		String paramPass = req.getParameter("password");
		Map<String, String[]> paramMap = req.getParameterMap();
		Enumeration<String> paramName = req.getParameterNames();
		
		resp.setContentType("text/html; charset=utf-8");

		PrintWriter pw = resp.getWriter();
		
		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">");
		pw.println("<title>LoginProcess</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("-----------------------");
		pw.println("<br/>getParameterValues <br/> ");
		for(String str : paramUserIdArr){
			pw.println("UserID : " + str +"<br/>");
		}
		pw.println("-----------------------");
		pw.println("<br/>getParameter <br/> ");
		pw.println("password : " + paramPass + "<br/>");
		
		pw.println("-----------------------");
		pw.println("<br/> parameterMap <br/>");
		for(String str : paramMap.get("userId")){
			pw.println("userId : " + str + "<br/>");
		}
		for(String pass : paramMap.get("password")){
			pw.println("password : " + pass + "<br/>" );
		}
		
		pw.println("-----------------------");
		pw.println("<br/> parameterNames <br/>");
		while(paramName.hasMoreElements()){
			pw.println("paramName : " + paramName.nextElement() + "<br/>");
		}
		
		pw.println("</body>");
		pw.println("</html>");
		
		
	}
	
	
	
}

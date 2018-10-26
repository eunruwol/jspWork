package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/filterServlet")
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int hitCount;
	
	public void init(){
		hitCount = 0;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("counting get");
		hitCount++;
		System.out.println(hitCount);
		
		PrintWriter out = response.getWriter();
		String docType = "<!DOCTYPE html>";
		out.println(docType + "<html>\n" +
				"<head><title>title</title></head>" +
				"<body>\n" + hitCount + "</body>" + "</html>"
		);
		request.getRequestDispatcher("/filter/requestCount.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// character encoding 설정을 filter로 이관(코드 중복 제거)
		// encoding 설정
		// request.setCharacterEncoding("UTF-8");
		// getServletContext();
		
		// userNm 파라미터 받기
		String userNm = request.getParameter("userNm");
		
		// request 속성으로 저장
		request.setAttribute("userNm", userNm);
		
		// request forward (/filter/view.jsp)
		request.getRequestDispatcher("/filter/requestCount.jsp").forward(request, response);
		
		// view.jsp request객체의 userNm이라고 설정한 속성을 화면에 표시
	}
	public void destroy(){
		
	} 
}
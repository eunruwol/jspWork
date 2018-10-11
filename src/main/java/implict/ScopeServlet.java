package implict;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ScopeServlet
 */
@WebServlet("/scopeServlet")
public class ScopeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageScope = request.getParameter("pageScope");
		String requestScope = request.getParameter("requestScope");
		System.out.println(requestScope);
		String sessionScope = request.getParameter("sessionScope");
		System.out.println(sessionScope);
		String applicationScope = request.getParameter("applicationScope");
		System.out.println(applicationScope);
		
		
		//속성 설정 setAttribute(String name, Object value)
		//속성 가져오기 getAttribute(String name)
		
		//page영역 : sevlet에선 해당없음

		//requset 영역
		request.setAttribute("requestScope", requestScope + "_attr" );

		//session 영역
		HttpSession session = request.getSession();
		session.setAttribute("sessionScope", sessionScope + "_attr" );
		
		//applicaiont 영역
		ServletContext application = getServletContext();
		application.setAttribute("applicationScope", applicationScope + "_attr" );
		
		RequestDispatcher rd = request.getRequestDispatcher("/implict/scopeResult.jsp");
		rd.forward(request, response);
		
		
	}

}




















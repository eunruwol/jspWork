package kr.or.ddit.sum;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MulCarculation
 */
@WebServlet("/mulCalculation")
public class MulCarculation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String param1Str = request.getParameter("param1");
		String param2Str = request.getParameter("param2");
		
		Long param1 = Long.parseLong(param1Str);
		Long param2 = Long.parseLong(param2Str);
		
		double mulResult = 1L;
		ArrayList<Double> mulResultList = new ArrayList<Double>();

		for(long i = param1 ; i <= param2 ; i++){
			mulResult *= i;
			mulResultList.add(mulResult);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("mulResult", mulResult);
		session.setAttribute("mulResultList", mulResultList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/mulResult.jsp");
		rd.forward(request, response);
		
		
	}

}

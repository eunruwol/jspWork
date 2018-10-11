package kr.or.ddit.sum;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SumCalculation
 */
@WebServlet("/sumCalculation")
public class SumCalculation extends HttpServlet {
	private static final long serialVersionUID = -9171365799240674586L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//만약 get으로 localhost:8081/sumCaculation 으로 접속했을시
		//sumInput.jsp로 이동시키기
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/sumInput.jsp");
		rd.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String startStr = request.getParameter("start");
		String endStr = request.getParameter("end");
		
		//int로 변경
		long start = Long.parseLong(startStr);
		long end = Long.parseLong(endStr);
		
		
		CalculationLogic logic = new CalculationLogic();
		long result =logic.sumBetweenTwoNumber(start, end);

		
		request.getSession().setAttribute("result", result);
		
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/sumResult.jsp");
		rd.forward(request, response);

		
	}

}

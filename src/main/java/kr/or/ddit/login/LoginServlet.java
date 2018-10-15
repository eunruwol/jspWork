package kr.or.ddit.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceInf;

public class LoginServlet extends HttpServlet{
	
	//service  --> request.getMethod() : "POST", "GET" --> doGet, doPost
	
	private String USER_ID;
	private String PASSWORD;
	
	private UserServiceInf userService;
	private UserVo userVo;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//1. 사용자 아이디와 비밀번호를 request객체에서 받아옴
		//2. db 에서 조회해온 아이디, 비밀번호를 체크
		//3-1. 일치할 경우 main.jsp로 이동
		//3-2. 불일치할경오 login.jsp로 이동.
		
		//1
		String userId = req.getParameter("userId");
		String password = req.getParameter("password");
		
		// remember-me 파라미터 받아서 sysout으로 출력
		String rememberMe = req.getParameter("remember-me");
		System.out.println("rememberMe : " + rememberMe);
		
		// rememberMe == null : 아이디 기억 사용 안함
		if(rememberMe == null){
			Cookie[] cookies = req.getCookies();
			for(Cookie cookie : cookies){
				// cookie 이름이 remember, userId 일경우 maxage를 -1설정하여 쿠키를 유효하지 않도록 설정
				System.out.println(cookie.getName());
				if(cookie.getName().equals("remember") || cookie.getName().equals("userId")){
					// -1 : 브라우저 재시작시 쿠키 삭제 반영
					// 0 : 바로 삭제
					cookie.setMaxAge(-1);
					resp.addCookie(cookie);
				}
			}
		}else{ // 아이디 기억 사용
			// response 객체에 쿠키를 저장
			Cookie cookie = new Cookie("remember", "Y");
			Cookie userIdCookie = new Cookie("userId", userId);
			
			resp.addCookie(cookie);
			resp.addCookie(userIdCookie);
		}
		
		//2 DB대신 상수로 대체함.. -> 10/10 DB에서 값을 가져와 비교
		//2-1 사용자가 전송한 userId 파라미터로 사용자 조회
		//2-2 db에서 조회한 사용자 비밀번호가 같은지 비교
		//2-3 session에 사용자 정보 등록
		//아래 3-1을 수정하자
		userService = new UserService();
		userVo = userService.selectUser(userId);
		if(userVo != null){
			USER_ID = userVo.getUserId();
			PASSWORD = userVo.getPass();
		}

		//3-1
		if(USER_ID.equals(userId) && PASSWORD.equals(password)){
			
			//redirect방식
//			resp.sendRedirect("main.jsp?userId="+userId+"&password="+password);
			//1.Session에 사용자 정보 설정
//			UserVo userVo = new UserVo();
//			userVo.setUserId(userId);
//			userVo.setName("잉위 맘스턴");
//			userVo.setAlias("김기동");
//			userVo.setBirth(new Date());
			
			//2.main.jsp body영역에 이름[별명]님 안녕하세요 출력
			HttpSession session = req.getSession();
			session.setAttribute("userVo", userVo);
			
			
			
			//Request Dispatch 방식
			RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
			rd.forward(req, resp);
			
		//3-2
		} else {
			
			resp.sendRedirect("login/login.jsp");
			
		}

		
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		//로그인을 위한 POST에 있던 기존 코드
//		req.setCharacterEncoding("utf-8");
//		resp.setContentType("text/html; charset=utf-8");
//
//		PrintWriter pw =resp.getWriter();
//		
//		pw.println("<!DOCTYPE html>");
//		pw.println("	<html>");
//		pw.println("		<head>");
//		pw.println("			<meta charset=\"UTF-8\">");
//		pw.println("			<title>Insert title here</title>");
//		pw.println("		</head>");
//		pw.println("		<body>");
//		
//		//userId : brwon / sally
//		String[] userIds = req.getParameterValues("userId");
//		for(String userId : userIds)
//			pw.println("		userId : " + userId + "<br>");
//		pw.println("		password : " + req.getParameter("password") + "<br>");
//		pw.println("		</body>");
//		pw.println("	</html>");
		
	}
	
	
	
}








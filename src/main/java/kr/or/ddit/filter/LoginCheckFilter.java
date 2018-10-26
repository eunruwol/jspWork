package kr.or.ddit.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/loginCheckFilter")
public class LoginCheckFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		String uri = ((HttpServletRequest)request).getRequestURI();
		
		if(uri.equals("/") ||
			uri.equals("/login/login.jsp") ||
			uri.equals("/dditLogin") ||
			uri.equals("/css") ||
			uri.startsWith("/js")){
				System.out.println("access allowed");
				chain.doFilter(request, response);
		}else{
			if(session.getAttribute("S_USER") == null){
				System.out.println();
				request.getRequestDispatcher("/").forward(request, response);
			}else{
				System.out.println("access allowed");
				chain.doFilter(request, response);
			}
		}
	}


	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}

package kr.or.ddit.user.web;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceInf;
import kr.or.ddit.util.model.StringUtil;

@MultipartConfig(maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
@WebServlet("/userUpdateForm")
public class UserUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServiceInf userService = new UserService();
		
		// post 한글 파라미터 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터 받아오기
		// name, pass, addr1, addr2, birth, zipcd, email, tel
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String zipcd = request.getParameter("zipcd");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");	
		String birth = request.getParameter("birth");
		Part profilePart = request.getPart("profile");
		
		// 파라미터를 userVo
		UserVo userVo = new UserVo();
		userVo.setUserId(userId);
		userVo.setName(name);
		userVo.setAddr1(addr1);
		userVo.setAddr2(addr2);
		userVo.setZipcd(zipcd);
		userVo.setPass(pass);
		userVo.setEmail(email);
		userVo.setTel(tel);
		
		String contentDisposition = profilePart.getHeader("Content-disposition");
		String fileName = StringUtil.getFileNameFromHeader(contentDisposition);
		
		if(fileName.equals("")){
			// fileName이 null일때 기존에 파일명을 가지고 와서 DB에 넣기
			
			// 1. DB에 있는 파일명 가지고 오기
			String result = userService.selectProfile(userId);
			
			// 2. vo에 파일명 넣기
			userVo.setProfile(result);
			
		}else{
			// 파일경로
			String path = getServletContext().getRealPath("/profile");
			profilePart.write(path + File.separator + fileName);
			profilePart.delete();
			
			userVo.setProfile("/profile/" + fileName);
		}	
		
		try {
			// yyyy-MM-dd
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			userVo.setBirth(sdf.parse(birth));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(userVo);
		
		// 사용자 수정 서비스 호출
		int updateCnt = userService.updateUser(userVo);
		
		// 사용자 리스트로 이동(redirect : 서버 상태가 변경되므로 사용자가 새로고침을 통해 재요청시 중복 등록되는 현상을 막는다
		response.sendRedirect("/userDetail?userId=" + userId);
	}
}
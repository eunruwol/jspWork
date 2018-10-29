package kr.or.ddit.file.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.service.UserService;
import kr.or.ddit.user.service.UserServiceInf;

@WebServlet("/fileDownloadName")
public class FileDownloadNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파일에 대한 정보(파일명 등) : header
		// 응답에 대한 정보(html이 아니라 바이너리 파일) : contentType
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=git.txt");
		
		// 1. 먼저 File 객체를 생성한다.
		File f = new File("D:\\A_TeachingMaterial\\6.JspSpring\\upload\\git.txt");
		
		// 2. 파일을 읽기 위한 객체 생성
		FileInputStream fis = new FileInputStream(f);
		
		// 3. 파일을 읽기 위한 크기 생성
		byte[] buffer = new byte[512];
		int len = 0;
		
		// 4. 파일 읽기 (buffer 크기만큼) , "-1"이면 더이상 읽을것이 없다라는 뜻
		ServletOutputStream sos = response.getOutputStream();
		while((len = fis.read(buffer)) != -1) {
			// 파일 쓰기 0부터 시작 len 만큼
			sos.write(buffer, 0, len);
		}
		sos.close();
		fis.close();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

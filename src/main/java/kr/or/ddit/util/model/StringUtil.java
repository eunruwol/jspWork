package kr.or.ddit.util.model;

public class StringUtil {
	public static String getFileNameFromHeader(String contentDisposition){
		String fileName = "";
		String[] splists = contentDisposition.split("; ");
		for(String str : splists){
			if(str.indexOf("filename=") >= 0){
				fileName = str.substring(10, str.lastIndexOf("\""));
			}
		}
		
		return fileName;
	}
	
	public static String getCookie(String cookieString, String cookieName){
		String[] cookies = cookieString.split("; ");
		// cookies[0] : remember=Y
		// cookies[1] : userId=brown
		// cookies[2] : etc=test
		
		String cookieValue = "";
		for(String str : cookies){
			// cookie값의 시작부분 = indexOf
			if(str.startsWith(cookieName + "=")){
				// 끝부분(lastIndexOf)은 미포함이기때문에 +1을 붙힌다
				cookieValue = str.substring((cookieName + "=").length());
			}
		}
		
		return cookieValue;
	}
}
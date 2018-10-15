package kr.or.ddit.etc;

import static org.junit.Assert.*;
import kr.or.ddit.util.model.StringUtil;

import org.junit.Test;

public class StringUtilTest {

	@Test
	public void test() {
		/***Given***/
		String contentDisposition = "form-data; name=\"profile\"; filename=\"brown.png\"";		

		/***When***/
		// logic
		String fileName = "";
		String[] splists = contentDisposition.split("; ");
		for(String str : splists){
			if(str.indexOf("filename=") >= 0){
				fileName = str.substring(10, str.lastIndexOf("\"")); 
			}
		}

		/***Then***/
		assertEquals("brown.png", fileName);
	}
	
	// 쿠키 문자열 파싱 테스트
	@Test
	public void getCookieTest(){
		/***Given***/
		String cookieString = "remember=Y; userId=brown; etc=test";

		/***When***/
		String cookieValue = StringUtil.getCookie(cookieString, "remember");
		String cookieValue2 = StringUtil.getCookie(cookieString, "userId");
		
		System.out.println(cookieValue);
		System.out.println(cookieValue2);

		/***Then***/
		assertEquals("Y", cookieValue);
		assertEquals("brown", cookieValue2);
	}
}
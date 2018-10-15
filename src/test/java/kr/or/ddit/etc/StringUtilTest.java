package kr.or.ddit.etc;

import static org.junit.Assert.*;

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
}
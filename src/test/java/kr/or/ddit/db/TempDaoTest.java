package kr.or.ddit.db;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.Test;

public class TempDaoTest {

	@Test
	public void getTemp() {
		/***Given : 주어진 상황***/
		TempDao tempDao = new TempDao();

		/***When : 어떤 동작을 수행 ***/
		Map<String, Object> map = tempDao.getTemp();
		System.out.println("map : " + map);
		// select 'X' as result from dual
		// result : X

		/***Then : 결과가 어떠해야 하는지 정의 ***/
		assertEquals("X", map.get("result") );
		
	}

}

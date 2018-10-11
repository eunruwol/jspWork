package kr.or.ddit.sum;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculationLogicTest {

	@Test
	public void sumBetweenTwoNumber() {
		CalculationLogic logic = new CalculationLogic();
		long start = 10;
		long end = 1;
		
		long sumResult = logic.sumBetweenTwoNumber(start, end);
		
		assertEquals(55, sumResult);
		
	}
	
	@Test
	public void sumBetweenTwoNumber2() {
		CalculationLogic logic = new CalculationLogic();
		long start = 1;
		long end = 10;
		
		long sumResult = logic.sumBetweenTwoNumber(start+2, end+2);
		
		assertEquals(75, sumResult);
		
	}
	
}


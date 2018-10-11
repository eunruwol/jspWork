package kr.or.ddit.sum;

public class CalculationLogic {

	public static void main(String[] args) {
		CalculationLogic logic = new CalculationLogic();
		long start = 1;
		long end = 10;
		
		long sumResult = logic.sumBetweenTwoNumber(start, end);
		if(sumResult == 55){
			System.out.println("정답");
		} else {
			System.out.println("실패");
		}
		
	}
	
	
	public long sumBetweenTwoNumber(long start, long end) {
		 
		long result = 0L;
		if(start > end){
			long tmp = start;
			start = end;
			end = tmp;
		}

		for(Long i = start ; i < end + 1 ; i++){
			result += i;
		}
		
		return result ;
	}

}

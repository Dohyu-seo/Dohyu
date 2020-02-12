package day03;

public class Tset05 {
	public static void main(String[] args) {
		int no1 = 10;
		int no2 = 11;
		/*
	 	논리연산자
	 		&	(and)
					참		거짓
			참		참		거짓
			거짓		거짓		거짓
			
			|	( or )
					참		거짓
			참		참		참
			거짓		참		거짓
	 */
		System.out.println((no1 > no2) && (no1++ < no2)); // && : 절삭 연산자. 앞쪽이 false이면 뒤에있는 연산은 계산할 필요가 없다고 실행됨.
		// no1 > no2 는 거짓이고 이 전체 결과는 뒤를 실행하지 않아도 거짓이니 뒷부분 연산은 실행하지 않는다.
		System.out.println("no1 : " + no1);
		System.out.println((no1 < no2) || (no1++ > no2)); // || : 절삭 연산자. 앞쪽이 true이면 뒤에있는 연산은 계산할 필요가 없다고 실행됨. 
		System.out.println("no1 : " + no1);
	}
}

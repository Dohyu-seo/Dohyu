package day03;

public class Test01 {
	public static void main(String[] args) {
		int no = 10; // = : 대입 연산자, 진행 순서가 오른쪽에서 왼쪽순으로 계산.
		System.out.println("1. no : " + no);
		no = no + 1;
		System.out.println("2. no : " + no);
		no += 1; // ==> no = no + 1;
		System.out.println("3. no : " + no);
		
		/*	산술 연산자는 모두 대입 연산자에 사용가능.
		 	-= : 
		 	*= : 
		 	/= : 
		 	%= :
		 */
		int num = 3;
		num *= 2; // ==> num = num * 2;
		num *= 2;
		System.out.println("num : " + num);
	}
}

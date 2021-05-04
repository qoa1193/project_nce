package day7;

public class MethodEx5 {

	public static void main(String[] args) {
		//  *****을 출력하도록 메소드를 생성하여 테스트해보세요.
		
		/*System.out.println(('*' * 3);*/  // 왜 ~가 나오지? @@@ *을 곱하기할방법 없나??
		printChar1('*',5);
		printChar1('*',9);
		printChar1('-',5);
		System.out.println(printChar2('*',5));
		System.out.println(printChar2('*',3) + printChar2('-',2));
	}
	//내코드
	/* 기능 : *****를 만드는 메소드
	public static char printChar(char op, int num1) {
		//@@@여기를 char말고 문자열로 해서 문자를 하나씩 더하면 됐네
		for(int i=0;i<num1;i+=1) {
					
		}
		return res;
		
	}*/
	
	//강사님 코드
	/* 기능 : 주어진 문자(ch)를 주어진 정수번(count)반복하여 출력하는 메소드
	 * 매개변수 : 문자, 정수번 (횟수) char ch, int count
	 * 리턴타입 : 없음 => void
	 * 메소드명 : printChar1*/
	public static void printChar1(char ch, int count) {
		for(int i =0;i<count;i+=1) {
			System.out.print(ch);
		}
		System.out.println();
	}
	/* 기능 : 주어진 문자(ch)를 주어진 정수번(count)반복하여 하나의 문자열로 알려주는 메소드
	 * 매개변수 : 문자, 횟수 => char ch, int count
	 * 리턴타입 : 문자열 => String
	 * 메소드명 : printChar2*/
	public static String printChar2(char ch, int count) {
		String str = "";
		//문자열 + 문자 => 문자열
		for(int i =0;i<count;i+=1) {
			//i=0 "" + '*' => "*"
			//i=1 "*" + '*' => "**"
			//i=count-1 "**...**"+'*'=>"*...*"(*이 count개)
			str = str + ch;
		}
		return str;
	}
	
	
}

package day4;

import java.util.Scanner;

public class Test4_4 {

	public static void main(String[] args) {
		//랜덤숫자맞추기 게임 	@@@얘도 다시 풀어볼것
		
		/* #명령어 설명
		 * Math.random()은 0보다 크거나 같고 1보다 작은 임의의 실수를 생성하는 기능
		 *Math.random(): A
		 * 0<=A<1
		 * 0*(max-min+1)<=A*(max-min+1)<1*(max-min+1)
		 * 0<=A*(max-min+1)<max-min+1
		 * min<=A*(max-min+1)+min<max+1 //@@@이거 정수씌우면 어케되지?
		 * 
		 * */
		 
		
		int min = 1, max = 100;
		int r =(int)(Math.random()*(max-min+1)+min); 
		/*정수를 랜덤으로 생성하여 생성된 숫자를 맞추는 게임
		 * 예시(랜덤하게 생성된 숫자가 25인경우)
		 * 정수가 랜덤으로 생성되었습니다. 게임시작!
		 * 정수를 입력하세요 :100
		 * down
		 * 정수를 입력하세요 : 20
		 * up
		 * 정수를 입력하세요 : 25
		 * 정답입니다.
		 * 반복횟수 : x
		 * 규칙성 : 정수를 입력하세요라는 문자열을 출력
		 * 콘솔에서 정수를 입력받음
		 * 입력받은 정수가 랜덤한 수보다 크면 down이라고 출력하고
		 * 입력받은 정수가 랜덤한 수보다 작으면 up이라고 출력하고
		 * 입력받은 정수가 랜덤한 수와 같으면 정답입니다라고 출력 후 종료
		 * 반복문 종료 후 : 없음
		 * */
		Scanner scan = new Scanner(System.in);
		System.out.println("정수가 랜덤으로 생성되었습니다.게임시작!");
		System.out.println(r); //test용 : 정답부터 미리 확인후 실행한 뒤 지울 부분
	
		int num;
		for(;;) {	
				System.out.print("정수를 입력하세요("+min+"~"+max+"): ");		//이렇게하면 min,max숫자 일일히 수정안해도 됨
				num = scan.nextInt();
				//@@@정수 입력 ->r인지 비교 ->r보다 크면 업 작으면 다운->계속 입력받기->정답이면 루프 종료
				if(num>max||num<min) {
					System.out.println("잘못된 범위입니다. 1~100사이로 입력하세요.");
					continue;
				}
				
				if(num>r) {
					System.out.println("down");			//@@@순서바뀌면?
				}else if(num<r) {
					System.out.println("up");
				}else if(num==r) {						//3가지 조건(num<)(r=)(<num)이므로 else만해도 됨
					System.out.println("정답입니다.");
					break;
				}
		}
		scan.close();
		
		/*for(num=min;num<=max;) {
			if(num==r) {
				System.out.println(r);
				System.out.println("정답입니다.");
				break;
			}else if(num<r){
				System.out.println("up");
			}else if(num>r) {
				System.out.println("down");
			}*/
	}

}

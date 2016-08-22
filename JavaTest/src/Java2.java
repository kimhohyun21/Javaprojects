import java.util.*;

public class Java2 {
	public static void main(String[] args){
		Scanner scan=new Scanner(System.in);
		String useMoney;
		int money;
		int sum=0;
		
		while(true){			
			System.out.print("사용하실 금액을 입력하세요 : ");
			useMoney = scan.nextLine();
			
			money = Integer.parseInt(useMoney);
			
			sum+=money;
			
			if(sum>10000){
				System.out.println("잔액이 부족해 교통카드를 사용할 수 없습니다.");
				break;
			}			
		}			
	}	
}

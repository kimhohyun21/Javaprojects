import java.util.*;

public class Java2 {
	public static void main(String[] args){
		Scanner scan=new Scanner(System.in);
		String useMoney;
		int money;
		int sum=0;
		
		while(true){			
			System.out.print("����Ͻ� �ݾ��� �Է��ϼ��� : ");
			useMoney = scan.nextLine();
			
			money = Integer.parseInt(useMoney);
			
			sum+=money;
			
			if(sum>10000){
				System.out.println("�ܾ��� ������ ����ī�带 ����� �� �����ϴ�.");
				break;
			}			
		}			
	}	
}

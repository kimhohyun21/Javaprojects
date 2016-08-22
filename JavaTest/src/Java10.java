import java.util.*;

public class Java10 {
	public static void main(String[] args){
		Scanner scan=new Scanner(System.in);
		
		try{
			System.out.print("정수를 입력하세요 :");
			int a=scan.nextInt();
			
			System.out.print("정수를 입력하세요 :");
			int b=scan.nextInt();
			
			System.out.print("정수를 입력하세요 :");
			int c=scan.nextInt();
			
			int[] ans=comparison(a,b,c);
			
			System.out.println("정렬전 데이터 :"+a+","+b+","+c);
			System.out.println("정렬후 데이터 :"+ans[0]+","+ans[1]+","+ans[2]);
		}catch(Exception ex){
			System.out.println("정수가 아닙니다.");
			return;
		}
	}
	
	public static int[] comparison(int a, int b, int c){
		int e=a;
		int f=b;
		int g=c;
		int big=0, middle=0, small=0;
		
		if(e>f && e>g && f>g){
			big=e;			
			middle=f;
			small=g;
		}else if(e>f && e>g && f<g){
			big=e;
			middle=g;
			small=f;
		}else if(e<f && e>g && f>g){
			big=f;
			middle=e;
			small=g;
		}else if(e<f && e<g && f>g){
			big=f;
			middle=g;
			small=e;
		}else if(e<f && e<g && f<g){
			big=g;
			middle=f;
			small=e;
		}else if(e>f && e<g && f<g){
			big=g;
			middle=e;
			small=f;
		}	
		
		int[] com={small, middle, big};
		return com;
	}
}

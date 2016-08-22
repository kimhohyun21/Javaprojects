package com.sist.test5;

public class Java5 {
	public static void main(String[] args){
		Car car1=new Car();
		Car car2=new Car();
		Car car3=new Car();
		
		System.out.println(car1.model+"1의 속도는 "+car1.curSpeed+"이다.");
		car2.speedUp();
		System.out.println(car2.model+"2의 속도는 "+car2.curSpeed+"이다.");
		car3.speedDown();
		System.out.println(car3.model+"3의 속도는 "+car3.curSpeed+"이다.");
		
		SportsCar sc=new SportsCar();
		sc.speedDown();
		System.out.println("스포츠 "+sc.model+"의 속도는 "+sc.curSpeed+"이다.");
	}	
	
}

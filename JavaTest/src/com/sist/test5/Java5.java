package com.sist.test5;

public class Java5 {
	public static void main(String[] args){
		Car car1=new Car("hyundae", "genesis", "silver", 10);
		Car car2=new Car("GM", "spark", "blue", 20);
		Car car3=new Car("BMV", "i8", "white", 30);
		
		System.out.println(car1.model+"�� �ӵ��� "+car1.curSpeed+"�̴�.");
		car2.speedUp();
		System.out.println(car2.model+"�� �ӵ��� "+car2.curSpeed+"�̴�.");
		car3.speedDown();
		System.out.println(car3.model+"�� �ӵ��� "+car3.curSpeed+"�̴�.");
		
		SportsCar sc=new SportsCar("jaguar", "xf", "red", 50);
		sc.speedDown();
		System.out.println("������ ī "+sc.model+"�� �ӵ��� "+sc.curSpeed+"�̴�.");
	}	
	
}

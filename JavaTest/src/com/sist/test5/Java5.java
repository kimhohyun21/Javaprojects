package com.sist.test5;

public class Java5 {
	public static void main(String[] args){
		Car car1=new Car();
		Car car2=new Car();
		Car car3=new Car();
		
		System.out.println(car1.model+"1�� �ӵ��� "+car1.curSpeed+"�̴�.");
		car2.speedUp();
		System.out.println(car2.model+"2�� �ӵ��� "+car2.curSpeed+"�̴�.");
		car3.speedDown();
		System.out.println(car3.model+"3�� �ӵ��� "+car3.curSpeed+"�̴�.");
		
		SportsCar sc=new SportsCar();
		sc.speedDown();
		System.out.println("������ "+sc.model+"�� �ӵ��� "+sc.curSpeed+"�̴�.");
	}	
	
}

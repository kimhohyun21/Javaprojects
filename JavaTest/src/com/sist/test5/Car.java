package com.sist.test5;

public class Car {
	String maker;
	String model;
	String color;
	int curSpeed;		
	
	public Car(String maker, String model, String color, int curSpeed) {
		super();
		this.maker = maker;
		this.model = model;
		this.color = color;
		this.curSpeed = curSpeed;
	}

	public void speedUp(){
		curSpeed++;
	}
	
	public void speedDown(){
		curSpeed--;
	}
}

package com.sist.test5;

public class Car {
	String maker;
	String model;
	String color;
	int curSpeed;
	
	public Car(){
		maker="hyundae";
		model="genesis";
		color="silver";
		curSpeed=10;	

	}
	
	public void speedUp(){
		curSpeed++;
	}
	
	public void speedDown(){
		curSpeed--;
	}
}

package com.sist.test7;

import java.util.*;
import java.net.*;
import java.io.*;

public class Java7Client {
	public static void main(String[] args){
		Socket s;
		BufferedReader scan;
		BufferedWriter out;
		BufferedReader in;
		String cal;
		String ans;
		
		try{
			s=new Socket("localhost", 8000);
			System.out.println("클라이언트 서버 접속!");
			
			scan=new BufferedReader(new InputStreamReader(System.in));
			out=new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
			in=new BufferedReader(new InputStreamReader(s.getInputStream()));
			
			System.out.print("곱셈할 숫자 2개를 입력하세요(콤마로 구분) :");
			cal=scan.readLine();
			
			out.write(cal+"\n");
			out.flush();
			
			ans=in.readLine();
			System.out.println("정답 : "+ans);
			
			s.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		
	}
}

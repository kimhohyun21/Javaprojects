package com.sist.test7;

import java.io.*;
import java.net.*;
import java.util.*;

public class Java7Server {
	public static void main(String[] args){
		ServerSocket ss;
		Socket s;
		BufferedReader in;
		BufferedWriter out;
		String arr[]=new String[2];
		
		try{
			ss=new ServerSocket(8000);
			System.out.println("## 서버 실행");
			s=ss.accept();
			System.out.println("## 클라이언트 접속완료!");
			
			in=new BufferedReader(new InputStreamReader(s.getInputStream()));
			out=new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
			
			String cal=in.readLine();
			System.out.println(cal);
			
			StringTokenizer str=new StringTokenizer(cal,",");
			
			for (int i = 0; i < 2; i++) {
				arr[i] = str.nextToken();
				System.out.println(arr[i]);
			}	
			
			int a=Integer.parseInt(arr[0]);
			int b=Integer.parseInt(arr[1]);
			
			int c=a*b;
			System.out.println(c);
			
			out.write(String.valueOf(c)+"\n");
			out.flush();
			
		}catch(Exception ex){
			ex.printStackTrace();;
		}
	}
	
	
}

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
			System.out.println("Ŭ���̾�Ʈ ���� ����!");
			
			scan=new BufferedReader(new InputStreamReader(System.in));
			out=new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
			in=new BufferedReader(new InputStreamReader(s.getInputStream()));
			
			System.out.print("������ ���� 2���� �Է��ϼ���(�޸��� ����) :");
			cal=scan.readLine();
			
			out.write(cal+"\n");
			out.flush();
			
			ans=in.readLine();
			System.out.println("���� : "+ans);
			
			s.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		
	}
}

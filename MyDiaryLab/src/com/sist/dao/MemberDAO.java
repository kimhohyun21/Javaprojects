package com.sist.dao;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

public class MemberDAO {
	//db ����̹�, ���� url, username, pwd�� server.xml�ʿ� ����
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//����Ŭ ����
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//����Ŭ ����
	public void getConnection(){
		try{
			/*
			 * #DBCP ���� �� ����
			 * 	1) Ŀ�ؼ��� �������� �κ��� �����ϰ�� ������ �ڵ� �ҽ��� ������
			 * 	2) java���Ͽ��� ������ new InitialContext()�� Context��ü�� Ȯ���ϰ�
			 *     JNDI(Java Naming and Directory Interface) �̸����� DataSource��ü�� ������
			 *  3) �ۿ��� JNDI ������ "java://comp/env"�� Context��ü�� ������ ��
			 *     server.xml�� ����� JNDI�� �̸��� jdbc/oracle�� DataSource��ü�� ������
			 *  4) Connection��ü�� DataSource�� getConnection()�޼ҵ带 ȣ��
			 */
			
			Context init=new InitialContext();
			Context ctx=(Context) init.lookup("java://comp/env"); 
			DataSource ds=(DataSource) ctx.lookup("jdbc/oracle");
			conn=ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//�α��� ��� (session�� �����Ͽ� �α� �ƿ� ������ �����ǵ��� ��)
	public String isLogin(String id, String pwd){
		String result="";
		try{
			getConnection();
			
			String sql="SELECT COUNT(*) FROM member WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			
			if(count==0){
				result="NOID";
			}else{
				sql="SELECT pwd, name FROM member WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String db_name=rs.getString(2);
				rs.close();
				
				if(!db_pwd.equals(pwd)){
					result="NOPWD";
				}else{
					result=db_name;
				}
			}			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return result;
	}
}

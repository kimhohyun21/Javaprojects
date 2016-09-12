package com.sist.dao;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

public class MemberDAO {
	//db 드라이버, 접속 url, username, pwd는 server.xml쪽에 설정
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//오라클 해제
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//오라클 연결
	public void getConnection(){
		try{
			/*
			 * #DBCP 설정 및 구현
			 * 	1) 커넥션을 가져오는 부분을 제외하고는 기존의 코딩 소스와 동일함
			 * 	2) java파일에서 접근은 new InitialContext()로 Context객체를 확보하고
			 *     JNDI(Java Naming and Directory Interface) 이름으로 DataSource객체를 참조함
			 *  3) 앱에서 JNDI 접근은 "java://comp/env"로 Context객체에 접근한 후
			 *     server.xml에 등록한 JNDI의 이름인 jdbc/oracle로 DataSource객체를 참조함
			 *  4) Connection객체는 DataSource의 getConnection()메소드를 호출
			 */
			
			Context init=new InitialContext();
			Context ctx=(Context) init.lookup("java://comp/env"); 
			DataSource ds=(DataSource) ctx.lookup("jdbc/oracle");
			conn=ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//로그인 기능 (session에 저장하여 로그 아웃 전까지 유지되도록 함)
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

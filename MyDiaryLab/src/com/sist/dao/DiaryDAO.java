package com.sist.dao;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DiaryDAO {
	private PreparedStatement ps;
	private Connection conn;
	private ResultSet rs;
	
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
			
			Context init=new InitialContext();
			Context ctx=(Context) init.lookup("java://comp/env"); 
			DataSource ds=(DataSource) ctx.lookup("jdbc/oracle");
			conn=ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//다이어리 일정 개수 카운팅 
	public int isDate(String id, int year, int month, int day){
		int count=0;
		
		try{
			getConnection();
			
			String sql="SELECT COUNT(*) FROM diary "
						+ "WHERE id=? AND year=? AND month=? AND day=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, year);
			ps.setInt(3, month);
			ps.setInt(4, day);
			rs=ps.executeQuery();
			rs.next();
			
			count=rs.getInt(1);
			rs.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return count;
	}
}

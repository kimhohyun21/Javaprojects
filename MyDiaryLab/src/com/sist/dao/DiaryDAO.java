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
			Context ctx=(Context) init.lookup("java:/comp/env"); 
			DataSource ds=(DataSource) ctx.lookup("jdbc/oracle");
			conn=ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List<DiaryVO> totalContent(String id, int page){
		List<DiaryVO> list=new ArrayList<>();
		
		try{
			getConnection();
			
			int rowSize=10;
			int start=(page*rowSize)-(rowSize-1);
			int end=(page*rowSize);
			
			String sql="SELECT no, id, subject, year, month, day, regDate, num "
						+ "FROM (SELECT no, id, subject, year, month, day, regDate, rownum as num "
						+ "FROM (SELECT no, id, subject, year, month, day, regDate "
						+ "FROM diary WHERE id=? ORDER BY no DESC)) "
						+ "WHERE num BETWEEN "+start+" AND "+end;
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			while(rs.next()){
				DiaryVO vo=new DiaryVO();
				vo.setNo(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setYear(rs.getInt(4));
				vo.setMonth(rs.getInt(5));
				vo.setDay(rs.getInt(6));
				vo.setRegDate(rs.getDate(7));
				
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}		
		return list;
	}
}

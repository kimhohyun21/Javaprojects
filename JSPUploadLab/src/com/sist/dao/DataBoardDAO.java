package com.sist.dao;

import java.util.*;
import java.sql.*;
public class DataBoardDAO {
	private PreparedStatement ps;
	private Connection conn;
	private ResultSet rs;
	private String url="jdbc:oracle:thin:@211.238.142.88:1521:ORCL";
	private String user="scott";
	private String pwd="tiger";
	
	//오라클 연결
	public DataBoardDAO(){
		try{
			Class.forName("oracle.jdbc.driver.DriverManager");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//오라클 연결 해제
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
			conn=DriverManager.getConnection(url,user,pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//전체데이터 읽기
	/*
	  JSP 자료실 목록 출력 (SQL)
	  - 페이지 나누기 SQL 소스
	  
	  - 페이지 변수 선언
	    int rowSize=10;
	  
	  - 페이지 시작 번호, 끝번호 선어
	  	int start=(page*rowSize)-(rowSize-1); //1,11
	    int end=(page*rowSize);				 //10,20
	  
	  - SQL문 : 정형화 되어 있음
	  	String sql="SELECT no, subject, name, regDate, hit, num "
	  				+ FROM (SELECT no, subject, name, regDate, hit, rownum as num "
	  				+ FROM (SELECT no, subject, name, regDate, hit "
	  				+ FROM dataBoard ORDER BY no DESC)) "
	  				+ WHERE num BETWEEN "+start+" AND "+end;
	  	 
	    Start : rownum의 시작 위치
	    End : rownum의 마지막 위치
	  
	   
	    ROWNUM : 가상컬럼, sql조회 결과의 순번을 나타냄. 자료의 일부분만 확인 처리할 때 유용.	  
	 */
	
	public List<DataBoardVO> dataBoardListData(int page){
		List <DataBoardVO> list=new ArrayList<>();
		
		try{
			getConnection();
			
			int rowSize=10;
			int start=(page*rowSize)-(rowSize-1);
			int end=page*rowSize;
			
			String sql="SELECT no, subject, name, regDate, hit, num "
					+ "FROM (SELECT no, subject, name, regDate, hit, rownum as num "
					+ "FROM (SELECT no, subject, name, regDate, hit "
					+ "FROM dataBoard ORDER BY no DESC)) "
					+ "WHERE num BETWEEN "+start+" AND "+end;
			
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()){
				DataBoardVO vo=new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegDate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				
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

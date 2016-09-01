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
	
	//����Ŭ ����
	public DataBoardDAO(){
		try{
			Class.forName("oracle.jdbc.driver.DriverManager");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//����Ŭ ���� ����
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
			conn=DriverManager.getConnection(url,user,pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//��ü������ �б�
	/*
	  JSP �ڷ�� ��� ��� (SQL)
	  - ������ ������ SQL �ҽ�
	  
	  - ������ ���� ����
	    int rowSize=10;
	  
	  - ������ ���� ��ȣ, ����ȣ ����
	  	int start=(page*rowSize)-(rowSize-1); //1,11
	    int end=(page*rowSize);				 //10,20
	  
	  - SQL�� : ����ȭ �Ǿ� ����
	  	String sql="SELECT no, subject, name, regDate, hit, num "
	  				+ FROM (SELECT no, subject, name, regDate, hit, rownum as num "
	  				+ FROM (SELECT no, subject, name, regDate, hit "
	  				+ FROM dataBoard ORDER BY no DESC)) "
	  				+ WHERE num BETWEEN "+start+" AND "+end;
	  	 
	    Start : rownum�� ���� ��ġ
	    End : rownum�� ������ ��ġ
	  
	   
	    ROWNUM : �����÷�, sql��ȸ ����� ������ ��Ÿ��. �ڷ��� �Ϻκи� Ȯ�� ó���� �� ����.	  
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

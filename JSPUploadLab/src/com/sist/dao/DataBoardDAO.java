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
			Class.forName("oracle.jdbc.driver.OracleDriver");
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
	
	//��ü������ Ȯ�� 
	public int countTotalPage(){
		int total=0;
		
		try{
			getConnection();
			
			String sql="SELECT CEIL(COUNT(*)/10) FROM dataBoard";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	//�� ���ڵ� �� Ȯ�� 
	public int countRow(String no){
		int total=0;
		
		try{
			if(no==null){
				no="SELECT MAX(no) FROM dataBoard";
			}
			getConnection();
			
			String sql="SELECT COUNT(no) FROM dataBoard WHERE no BETWEEN 1 AND ("+no+")";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	//�� �Է�
	public void insert(DataBoardVO vo){
		try{
			getConnection();
			
			String sql="INSERT INTO dataBoard (no, name, subject, content, filename, filesize, pwd) "
						+ "VALUES(db_no_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getFilename());
			ps.setInt(5, vo.getFilesize());
			ps.setString(6, vo.getPwd());
			ps.executeUpdate();		
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
	}
	
	//�� �� ����
	public DataBoardVO contentDetail(String no, int type){
		DataBoardVO vo=new DataBoardVO();
		
		try{
			getConnection();
			
			if(type==1){
				//hit�� ����
				String sql="UPDATE dataBoard SET hit=hit+1 WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, no);
				ps.executeUpdate();
				ps.close();
			}

			//�� �ҷ�����
			String sql="SELECT no, name, subject, content, regDate, hit, filename, filesize "
			    + "FROM dataBoard WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, no);
			rs=ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegDate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			rs.close();

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return vo;
	}
	
	//�� �����ϱ�
	public boolean update(DataBoardVO vo){
		boolean bCheck=false;
		try{
			getConnection();
			
			String sql="SELECT pwd FROM dataBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			rs=ps.executeQuery();
			rs.next();
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(!db_pwd.equals(vo.getPwd())){
				bCheck=false;
			}else{
				sql="UPDATE dataBoard "
						+ "SET name=?, subject=?, content=?, filename=NVL(?,''), filesize=NVL(?,''), pwd=? "
						+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setString(4, vo.getFilename());
				ps.setInt(5, vo.getFilesize());
				ps.setString(6, vo.getPwd());
				ps.setInt(7, vo.getNo());
				ps.executeUpdate();
				
				bCheck=true;
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return bCheck;
	}
}



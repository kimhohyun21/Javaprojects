package com.sist.dao;

import java.sql.*;
import java.util.*;

public class EmpDAO {
	private PreparedStatement ps;
	private Connection conn;
	private ResultSet rs;
	private final String url="jdbc:oracle:thin:@211.238.142.88:1521:ORCL";
	private final String username="scott";
	private final String password="tiger";
	private static EmpDAO dao;
	
	//드라이버 설치
	private EmpDAO(){ //외부에서 호출하지 못하게 private으로 선언
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//연결
	private void getConnection(){
		try{
			conn=DriverManager.getConnection(url,username,password);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//종료
	private void disConnection(){
		try{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//싱글턴 방식
	public static EmpDAO newInstance(){
		if(dao==null)
			dao=new EmpDAO();
		return dao;
	}
	
	//기능
	public ArrayList<EmpVO> empAllData(){
		ArrayList<EmpVO> list=new ArrayList<>();
		try{
			getConnection();
			String sql="SELECT empno, ename, job, hiredate FROM emp";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				EmpVO vo=new EmpVO(); // 각 row
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setHiredate(rs.getDate(4));
				
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}
			
		return list;
	}
	
	public EmpVO empDetailData(int empno){
		EmpVO vo=new EmpVO();
			
		return vo;
	}
}

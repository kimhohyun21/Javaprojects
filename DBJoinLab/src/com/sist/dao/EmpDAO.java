package com.sist.dao;

import java.util.*;
import java.sql.*;

public class EmpDAO {
	private Connection conn; // 연결
	private PreparedStatement ps; // SQL 전송
	private final String URL = "jdbc:oracle:thin:@211.238.142.88:1521:ORCL";
	private final String USER = "scott";
	private final String PASSWORD = "tiger";
	
	// 드라이버 등록
	public EmpDAO(){
		try{
			//클래스 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException cf){
			cf.printStackTrace();
		}
	}
	
	//오라클 DB접속
	public void getConnection(){
		try{
			conn= DriverManager.getConnection(URL, USER, PASSWORD);
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	//오라클 DB 접속 종료
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public List<EmpVO> empAllData(){
		List<EmpVO> list=new ArrayList<>();
		
		try{
			//DB연결
			getConnection();
			
			//SQL쿼리문
			String sql="SELECT empno, ename, job, mgr, "
					 + "hiredate, sal, comm, emp.deptno, dname, loc, grade "
					 + "FROM emp, dept, salgrade WHERE emp.deptno=dept.deptno "
					 + "AND sal BETWEEN losal AND hisal";
			
			//SQL쿼리문 전송
			ps=conn.prepareStatement(sql);
			
			//결과값 받기
			ResultSet rs=ps.executeQuery();
			
			//리스트에 결과값 추가
			while(rs.next()){
				EmpVO vo=new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setMgr(rs.getInt(4));
				vo.setHiredate(rs.getDate(5));
				vo.setSal(rs.getInt(6));
				vo.setComm(rs.getInt(7));
				vo.setDeptno(rs.getInt(8));
				vo.getDvo().setDname(rs.getString(9));
				vo.getDvo().setLoc(rs.getString(10));
				vo.getSvo().setGrade(rs.getInt(11));
				
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
}

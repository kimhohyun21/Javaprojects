package com.sist.dao;

import java.util.*;
import java.sql.*;

public class EmpDAO {
	private Connection conn; // ����
	private PreparedStatement ps; // SQL ����
	private final String URL = "jdbc:oracle:thin:@211.238.142.88:1521:ORCL";
	private final String USER = "scott";
	private final String PASSWORD = "tiger";
	
	// ����̹� ���
	public EmpDAO(){
		try{
			//Ŭ���� ���
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException cf){
			cf.printStackTrace();
		}
	}
	
	//����Ŭ DB����
	public void getConnection(){
		try{
			conn= DriverManager.getConnection(URL, USER, PASSWORD);
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	
	//����Ŭ DB ���� ����
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
			//DB����
			getConnection();
			
			//SQL������
			String sql="SELECT empno, ename, job, mgr, "
					 + "hiredate, sal, comm, emp.deptno, dname, loc, grade "
					 + "FROM emp, dept, salgrade WHERE emp.deptno=dept.deptno "
					 + "AND sal BETWEEN losal AND hisal";
			
			//SQL������ ����
			ps=conn.prepareStatement(sql);
			
			//����� �ޱ�
			ResultSet rs=ps.executeQuery();
			
			//����Ʈ�� ����� �߰�
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

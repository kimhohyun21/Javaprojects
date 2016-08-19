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
	
	//����̹� ��ġ
	private EmpDAO(){ //�ܺο��� ȣ������ ���ϰ� private���� ����
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//����
	private void getConnection(){
		try{
			conn=DriverManager.getConnection(url,username,password);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//����
	private void disConnection(){
		try{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//�̱��� ���
	public static EmpDAO newInstance(){
		if(dao==null)
			dao=new EmpDAO();
		return dao;
	}
	
	//���
	public ArrayList<EmpVO> empAllData(){
		ArrayList<EmpVO> list=new ArrayList<>();
		try{
			getConnection();
			String sql="SELECT empno, ename, job, hiredate FROM emp";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				EmpVO vo=new EmpVO(); // �� row
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
		try{
			getConnection();
			String sql="SELECT * FROM emp WHERE empno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, empno);
			rs=ps.executeQuery();
			while(rs.next()){
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));				
				vo.setJob(rs.getString(3));
				vo.setMgr(rs.getInt(4));
				vo.setHiredate(rs.getDate(5));
				vo.setSal(rs.getInt(6));
				vo.setComm(rs.getInt(7));
				vo.setDeptno(rs.getInt(8));
			}
			rs.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			disConnection();
		}	
		return vo;
	}
}

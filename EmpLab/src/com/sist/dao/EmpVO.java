package com.sist.dao;
/*
 EMPNO         NOT NULL NUMBER(4)
 ENAME                  VARCHAR2(10)
 JOB                    VARCHAR2(9)
 MGR                    NUMBER(4)
 HIREDATE               DATE
 SAL                    NUMBER(7,2)
 COMM                   NUMBER(7,2)
 DEPTNO                 NUMBER(2)
 
 *   servlet => Server + let : �������� �����ϴ� ������ ���α׷�
 *   => JSP
 *   
 *   Ŭ���̾�Ʈ�� ��û
 *   	id, pwd ==> Servlet : id, pwd ==> DAO ==> Oracle(DB)
 *     (�α��� ��û)   (������� Ŭ���̾�Ʈ�� ����)			   (�����)	
 *      
 *      ========> request("id", "jung") =======> jung | 1234   
 *      		  requset("pwd", "1234")
 */
import java.util.*;

public class EmpVO {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
	private int sal;
	private int comm;
	private int deptno;
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getMgr() {
		return mgr;
	}
	public void setMgr(int mgr) {
		this.mgr = mgr;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public int getComm() {
		return comm;
	}
	public void setComm(int comm) {
		this.comm = comm;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}	
}

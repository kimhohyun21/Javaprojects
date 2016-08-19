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
 
 *   servlet => Server + let : 서버에서 실행하는 가벼운 프로그램
 *   => JSP
 *   
 *   클라이언트의 요청
 *   	id, pwd ==> Servlet : id, pwd ==> DAO ==> Oracle(DB)
 *     (로그인 요청)   (결과값을 클라이언트에 응답)			   (결과값)	
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

package com.sist.dao;
/*
 * 구조
 * Emp
 * 		= empno (NUMBER ==> int)
 * 		= ename (VARCHAR2 ==> String[CHAR, CLOB])
 *  	= job (VARCHAR2 ==> String[CHAR, CLOB])
 *  	= mgr (NUMBER ==> int)
 *      = hiredate (DATE ==> java.util.date)
 *      = sal (NUMBER ==> int)
 *      = comm (NUMBER ==> int)
 *      = deptno (NUMBER == int)
 * 
 * 오라클 조인 ==> 자바 (포함 클래스) : 해서관계로 포함하고 있어야 한다
 * 
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
	
	//조인
	private DeptVO dvo=new DeptVO();
	private SalGradeVO svo=new SalGradeVO();
	
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
	public DeptVO getDvo() {
		return dvo;
	}
	public void setDvo(DeptVO dvo) {
		this.dvo = dvo;
	}
	public SalGradeVO getSvo() {
		return svo;
	}
	public void setSvo(SalGradeVO svo) {
		this.svo = svo;
	}
	
	
}

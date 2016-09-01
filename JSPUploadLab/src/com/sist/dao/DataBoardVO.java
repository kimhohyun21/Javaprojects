package com.sist.dao;
/*
   no        PK
   name      NN
   subject   NN
   content   NN
   pwd       NN
   regDate   DEFAULT
   hit       DEFAULT
   filename
   filesize
   
 */
import java.util.*;
public class DataBoardVO {
	private int no;
	private	String name;
	private String subject;
	private String pwd;
	private Date regDate;
	private int hit;
	private String filname;
	private int filesize;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFilname() {
		return filname;
	}
	public void setFilname(String filname) {
		this.filname = filname;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}	
}

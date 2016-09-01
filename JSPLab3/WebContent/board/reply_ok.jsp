<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	
	BoardDAO dao=new BoardDAO();
	BoardVO vo=new BoardVO();
	
	String no=request.getParameter("no");
	int rno=Integer.parseInt(no);
	/* vo=dao.contentDetail(no, 2);	
	int rno=vo.getRoot();
	System.out.println("re: "+no);
	System.out.println("re: "+rno); 
	*/
	
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	String curPage=request.getParameter("page");
	String fs=request.getParameter("fs");
	String ss=request.getParameter("ss");
	if(curPage==null)curPage="1";
	if(fs==null)fs="";
	if(ss==null)ss="";
	
	vo=new BoardVO();
	vo.setName(name);
	vo.setEmail(email);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);	
	
	dao.reply(rno, vo);
	
	out.println("<script>alert('답글이 등록되었습니다.');</script>");
	out.println("<script>location.href='main.jsp?page="+curPage+"&fs="+fs+"&ss="+ss+"'</script>");	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name").toString();
	String email=request.getParameter("email").toString();
	String subject=request.getParameter("subject").toString();
	String content=request.getParameter("content").toString();
	String pwd=request.getParameter("pwd").toString();
	String curPage=request.getParameter("page");
	String fs=request.getParameter("fs");
	String ss=request.getParameter("ss");
	if(curPage==null)curPage="1";
	if(fs==null)fs="";
	if(ss==null)ss="";
	
	BoardVO vo=new BoardVO();
	vo.setName(name);
	vo.setEmail(email);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	BoardDAO dao=new BoardDAO();
	dao.boardInsert(vo);
	
	out.println("<script>alert('새 글이 등록되었습니다.');</script>");
	out.println("<script>location.href='main.jsp?page="+curPage+"&fs="+fs+"&ss="+ss+"'</script>");	
%>

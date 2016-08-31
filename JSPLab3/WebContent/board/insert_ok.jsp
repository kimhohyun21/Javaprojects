<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name").toString();
	String email=request.getParameter("email").toString();
	String subject=request.getParameter("subject").toString();
	String content=request.getParameter("content").toString();
	String pwd=request.getParameter("pwd").toString();
	
	BoardVO vo=new BoardVO();
	vo.setName(name);
	vo.setEmail(email);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	BoardDAO dao=new BoardDAO();
	dao.boardInsert(vo);
	
	response.sendRedirect("main.jsp");

%>

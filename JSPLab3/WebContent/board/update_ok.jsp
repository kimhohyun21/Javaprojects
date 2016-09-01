<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String no=request.getParameter("no");
	int num=Integer.parseInt(no);
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
	
	BoardVO vo=new BoardVO();
	vo.setNo(num);
	vo.setName(name);
	vo.setEmail(email);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	BoardDAO dao=new BoardDAO();
	boolean bCheck=dao.contentUpdate(vo);
	
	if(bCheck==false){
		out.println("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
		out.println("<script>history.back();</script>");
	}else{
		out.println("<script>alert('수정되었습니다.');</script>");
		out.println("<script>location.href='main.jsp?page="+curPage+"&fs="+fs+"&ss="+ss+"'</script>");
	}
%>
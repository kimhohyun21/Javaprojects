<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("EUC-KR");
	String no=request.getParameter("no");
	int num=Integer.parseInt(no);
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
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
		out.println("<script>alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');</script>");
		out.println("<script>history.back();</script>");
	}else{
		response.sendRedirect("main.jsp");
	}
%>
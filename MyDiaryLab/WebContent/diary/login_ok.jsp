<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.net.*, com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.MemberDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	String result=dao.isLogin(id, pwd);
	
	if(result.equals("NOID")){
		out.write("<script>alert('ID�� �����ϴ�.'); </script>");
		out.write("<script>history.back(); </script>");
	}else if(result.equals("NOPWD")){
		out.write("<script>alert('PASSWORD ��ġ���� �ʽ��ϴ�.'); </script>");
		out.write("<script>history.back(); </script>");
	}else{
		session.setAttribute("name", result);
		session.setAttribute("id", id);
		out.write("<script>alert('"+result+"���� �α��εǾ����ϴ�.'); </script>");
		out.write("<script>location.href='diary.jsp'; </script>");
	}

%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ���(Bean)</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%--
	��ü ���� id="��ü��" class="Ŭ������"
	==> MemberBean mb=new MemberBean();�� �����ϰ� ��ü ����
 --%>
<jsp:useBean id="mb" class="com.sist.member.MemberBean">
	<jsp:setProperty name="mb" property="*"/>
</jsp:useBean>
<body>
	<div align="center">
		<h3>���� ���� �������� ���(Bean)</h3>
		ID : <jsp:getProperty property="id" name="mb"/><br/>
		Name : <jsp:getProperty property="name" name="mb"/><br/>
		Gender : <jsp:getProperty property="gender" name="mb"/><br/>
		Address : <jsp:getProperty property="addr" name="mb"/><br/>
		Telephone : <jsp:getProperty property="tel" name="mb"/><br/>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.member.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인 정보 출력</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String addr=request.getParameter("addr");
	String tel=request.getParameter("tel");
	
	MemberBean mb=new MemberBean();
	mb.setId(id);
	mb.setName(name);
	mb.setGender(gender);
	mb.setAddr(addr);
	mb.setTel(tel);
%>
<body>
	<div align="center">
		<h3>전송 받은 개인정보</h3>
		ID : <%=mb.getId() %> <br/>
		Name : <%=mb.getName() %> <br/>
		Gender : <%=mb.getGender() %> <br/>
		Address : <%=mb.getAddr() %> <br/>
		Telephone : <%=mb.getTel() %> <br/>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, java.text.*"
    errorPage="error.jsp"%>

<%--@ page import="java.util.*"--%>
<%--@ page import="java.text.*"--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(date); // 오늘 날짜를 simpledateformat으로 출력 
		
		int a=10/0;
	%>
	<%=today %>
	a: <%=a %>
</body>
</html>
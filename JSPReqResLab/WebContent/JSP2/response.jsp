<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert html title</title>
</head>
<body>
	<%-- 페이지(파일) 이동 --%>
	<%
		response.sendRedirect("input.jsp"); // 실행하면 지정된 페이지로 바로 이동
	%>
</body>
</html>
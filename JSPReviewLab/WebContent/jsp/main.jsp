<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.jsp.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>main</title>
	<link rel="stylesheet" type="text/css" href="table.css">
</head>
<%
	//main.jsp?no=1
	String no=request.getParameter("no");
	if(no==null){no="0";};
	String jsp=JSPChange.change(Integer.parseInt(no));	
%>
<body>
	<div align="center">
		<table id="content_table">
			<tr>
				<td id="title" colspan="2">
					JSP(Model 1) 정리
				</td>
			</tr>
			<tr>
				<td id="menu">
					<jsp:include page="menu.jsp"></jsp:include>
				</td>
				<td id="content">
					<jsp:include page="<%=jsp %>"></jsp:include>
				</td>
			</tr>
			<tr>
				<td id="footer" colspan="2">
					<address>&copy;2016 SIST 서울시 마포구 백범로 18 미화빌딩 쌍용강북교육센터</address>
				</td>
				
			</tr>	
		</table>		
	</div>	
</body>
</html>
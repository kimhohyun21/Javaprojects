<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.jsp.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>JSP(Model 1) 정리</title>
<%
	request.setCharacterEncoding("EUC-KR");
	
	//main.jsp?no=1 설정을 위한 파라미터와 함수
	String no=request.getParameter("no");
	if(no==null){no="0";};
	String jsp=JSPChange.change(Integer.parseInt(no));
%>	
	<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
	<div align="center">
		<table id="content_table">
			<tr>
				<td id="title" colspan="2">
					<a href="
					main.jsp" class="a">JSP(Model 1) 정리</a>
				</td>
			</tr>
			<tr>
				<td id="menu">
					<jsp:include page="menu.jsp" flush="true"></jsp:include>
				</td>
				<td id="content">
					<jsp:include page="<%=jsp %>" flush="true"></jsp:include>
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
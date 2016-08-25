<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String no=request.getParameter("no");
	
	if(no==null){
		no="2";
	}
	
	int n=Integer.parseInt(no);
	
	String s1="a.jsp";
	String s2="b.jsp";
	
	if(n==1){
		s1="a.jsp";
		s2="b.jsp";
	}else{
		s1="c.jsp";
		s2="d.jsp";
	}
	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table border="1" width="640" height="480">
			<tr>
				<%--JSP 파일안에 다른 JSP파일 포함 시키기 --%>
				<td><%pageContext.include("a.jsp"); %></td>
				<td><%pageContext.include("b.jsp"); %></td>
				<td><jsp:include page="<%=s1 %>"></jsp:include></td>
				<td><jsp:include page="<%=s2 %>"></jsp:include></td>
			</tr>
		</table>		
	</div>
</body>
</html>
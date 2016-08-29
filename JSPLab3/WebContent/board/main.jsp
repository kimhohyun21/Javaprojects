<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>커뮤니티 게시판</title>
</head>
<body>
	<div align="center">
		<table border="1" bordercolor="black" width="900" height="700">
			<tr>
				<td colspan="2" height="100">
					&nbsp;
				</td>		
			</tr>
			<tr>
				<td width="200" height="500">
					&nbsp;
				</td>
				<td width="700" height="500" align="center" valign="top">					
			<%
				request.setCharacterEncoding("EUC-KR");
				String no=request.getParameter("no");
				String content=request.getParameter("content");
				String fpage=request.getParameter("fpage");
				String fs=request.getParameter("fs");
				String ss=request.getParameter("ss");					
				
				if(no!=null){
			%>
					<jsp:include page="content.jsp"></jsp:include>
			
			<%
				}else if(content!=null){
			%>
					<jsp:include page="insert.jsp"></jsp:include>
			<%
				}else if(fpage!=null && fs!=null && ss!=null){
			%>
					<jsp:include page="find.jsp"></jsp:include>
			<%
				}else{
			%>
					<jsp:include page="list.jsp"></jsp:include>
			<%
				}					
			%>	
				</td>
			</tr>
			<tr>
				<td colspan="2" height="100">
					&nbsp;
				</td>
			</tr>		
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>scriptlet test</title>
</head>
<body>
	<div align="center">
		<h2>스크립트릿 테스트</h2>
		<hr>
		<%	
			int i;
			for(i=1;i<10; i++){
				//out.println(i+"<br/>");
		%>
				<%=i %><br/>
		<% 		
			}
		%>
	</div>
</body>
</html>
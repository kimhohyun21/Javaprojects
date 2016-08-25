<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>application Test</title>
</head>
<body>
<%
	String url=application.getInitParameter("url");
	String username=application.getInitParameter("username");
	String pwd=application.getInitParameter("pwd");
			
	application.log("URL"+url);
	application.log("USERNAME"+username);
	application.log("PWD"+pwd);
			
%>
	<div align="center">
		서버정보: <%=application.getServerInfo() %><br/>
		버전: <%=application.getMajorVersion() %>.
			 <%=application.getMinorVersion() %><br/>
		<hr/>
		Oracle URL: <%=url %><br/>
		Username: <%=username %><br/>
		Password: <%=pwd %>
	</div>
</body>
</html>
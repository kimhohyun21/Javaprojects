<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h3>application Test Result</h3>
		<hr />
		1.username에 설정된 값은 : &nbsp;<%=application.getAttribute("username") %><br />
		<%
			/* 내답
			String count=application.getAttribute("count").toString();			
			int num=Integer.parseInt(count)+1;
			*/
			
			//선생님 답
			Integer count=(Integer)application.getAttribute("count");
			int num=count.intValue()+1; //count는 객체이기 때문에 값을 정확히 intValue()사용 
			application.setAttribute("count", num);
			
		%>
		2.count : &nbsp;<%=num %>
	</div>
</body>
</html>
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
		1.username�� ������ ���� : &nbsp;<%=application.getAttribute("username") %><br />
		<%
			/* ����
			String count=application.getAttribute("count").toString();			
			int num=Integer.parseInt(count)+1;
			*/
			
			//������ ��
			Integer count=(Integer)application.getAttribute("count");
			int num=count.intValue()+1; //count�� ��ü�̱� ������ ���� ��Ȯ�� intValue()��� 
			application.setAttribute("count", num);
			
		%>
		2.count : &nbsp;<%=num %>
	</div>
</body>
</html>
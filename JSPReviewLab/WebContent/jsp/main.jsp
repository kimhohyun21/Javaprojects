<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.jsp.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>JSP(Model 1) ����</title>
<%
	request.setCharacterEncoding("EUC-KR");
	
	//main.jsp?no=1 ������ ���� �Ķ���Ϳ� �Լ�
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
					main.jsp" class="a">JSP(Model 1) ����</a>
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
					<address>&copy;2016 SIST ����� ������ ����� 18 ��ȭ���� �ֿ밭�ϱ�������</address>
				</td>	
			</tr>	
		</table>		
	</div>	
</body>
</html>
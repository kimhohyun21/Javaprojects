<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@JSP ���� ��ü �縮�� 1 : request
		1)Ư¡
			- JSP���� ���� ���� ���Ǵ� �⺻ ��ü
			- ���������� ��û�� ������ ����
			- Ŭ���̾�Ʈ�� ��û�� ������ �����ϴ� ���� request �⺻ ��ü��
			- ��� 
				=> Ŭ���̾�Ʈ (��������)�� ���õ� ���� �б� ����
				=> ������ ���õ� ���� �б� ���
				=> �Ӽ� ó�� ����
				
		2) ��ǥ���� �޼���
			- setCharacterEncoding()
			- getContentType()
			- getParameter(String name)
			  => HTML ���� ��û �Ķ���� ó��
			  	 : ���� �Է��� ���� ó���ϴ� ���� ���� ���� ����ϴ� ��� �߿� �ϳ�
			  	       ���۵� �����͸� �о�� �� �ִ� �޼���
			  => ���� ���� ���� ���� null
			  
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>output</title>
</head>
<body>
	<div align="center">
		<%
			request.setCharacterEncoding("EUC-KR");
			String name=request.getParameter("name");
		%>
		<%=name %>
	</div>
</body>
</html>
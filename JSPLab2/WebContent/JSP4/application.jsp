<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	@JSP ���尴ü 5: application
		1) application�� Ư¡
			- �� ���������̼�(���ؽ�Ʈ) ��ü�� �����ϴ� ��ü
			- �Ϲ������� ��Ĺ�� ���۰� ���� ������ ����Ŭ�� ����
			- application ��ü�� ���� �� �����̳� JSP���� ��������� �ϴ� ���� ������ ����, ������ �� ����
			- javax.servlet.ServletContextŬ����(��ü)�� ���� ���� ����
			- ServletContext��ü�� ��ü�̳ʿ� ���õ� ���������� ����	
			
	@JSP : ������ ���� ����
	
  ====================================================		
	   Ŭ���̾�Ʈ	                ���尴ü                       ������ ��������
  ====================================================
  	user, user2      application      Tomcat����ñ��� 
  ====================================================	 
	 user2		       session          �����ð� ��� 
  (�� ���� ������ ���)                        ������ ����
  ====================================================
     user1		   request, request   page�����θ� ����
  (�� ���� ������ ���) 	(page)   (page)
  ====================================================
  
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>application Test</h2>
		<hr />
		1.���� ���� : &nbsp;<%=application.getServerInfo() %><br /> 2.���� API���� ����
		: &nbsp;<%=application.getMajorVersion()+"."+application.getMinorVersion() %><br />
		3.application.jsp ������ ������� : &nbsp;<%=application.getRealPath("application.jsp") %><br />
		<hr />
		setAttribute�� username������ "������" ����
		<p>
			<%
			application.setAttribute("username", "������");
			application.setAttribute("count", 1);
		%>
			<a href="application_result.jsp">Ȯ���ϱ�</a>
			<!-- �ٸ� �������� ����� �����͸� �����Ͽ� ����� �� �ִ��� Ȯ�� -->
	</div>
</body>
</html>
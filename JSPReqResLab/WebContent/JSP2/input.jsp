<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@jSp�� ���� ����
		input.jsp =======> input_jsp.java
					 	   ============== java�� main()���� ����Ǵ� ��ó�� �۵�
					 	   ___jspInit() ����
					 	   while(true){
					 	   
					 	   		__jspService() if(POST) else(GET) Thread(run)
					 	   		=> doPost, doGet	
					 	   
					 	   }
					 	   __jspDestroy() : ���ΰ�ħ, ������ �̵�(�޸� ����)		
 --%>
<%--
	@������(����) �̵�
		1) HTML : <a href="">, <form action="">
		2) JavaScript : location
		3) JAVA : sendRedirect, forward
		   Ex) insert.jsp ==> insert_ok.jsp �� ���
		   	   ==> sendRedirect("insert_ok.jsp")
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<a href="forward.jsp?id=admin">����</a>
	</div>
</body>
</html>
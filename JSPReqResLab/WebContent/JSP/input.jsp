<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	@�� ���ø����̼� ������ ���� �ʿ��� ����
		1) ������ : ���������� ��û�� �޾� �˸��� ����� ���������� �����ϴ� ����
		2) ���ø����̼� ���� : �Խñ� ���, �α��� ó���� ���� ����� �����ϰ� �� ����� �������� �������� ����
		3) �����ͺ��̽� : �����ø����̼��� �ʿ�� �ϴ� ������ ����
			Ex) ȸ�� ����, �Խ��� ��, ������ ��
		4) �� ������ : �� ������ ���� ���� ��û, �������� ó�� ����� ����ڿ��� ������

 -->
 <%--
 	@JSP �������� �������
 		1) ��Ƽ��(Directive) : <%@ %>�ȿ� PAGE, TAGLIB, INCLUDE, import �ۼ�
 		2) ��ũ��Ʈ(Script)
 			- ��ũ��Ʈ��(Scriptlet) : <%�ڹ��ڵ� �ۼ�, ����  %> 
 			- ǥ����(Expression) : <%=�� ��� %>
 			- �����(Declaration): <%!�޼��� ���� %>
 		3) ǥ�����(Expression Language)
 		4) �⺻��ü(Implicit Object)
 			- request : Ŭ���̾�Ʈ�� ��û ������ ������
 			- response : ���� ������ ������
 			- pageContext : JSP�� ������������ ����
 			- session : HTTP�� ���� ������ ����
 			- application : �� ���ø����̼ǿ� ���� ����
 			- out : JSP�������� �����ϴ� ����� ����� �� ����ϴ� ��½�Ʈ��
 			- config : �������� ����
 			- page : java.lang.Object�� ����, �ڹ� Ŭ������ �ν��Ͻ�
 			- exception : ����ó��, ���� ������������ ���
 		5) ������ ������
 		6) ǥ�� �׼� �±�(Action Tag): <jsp:action> </jsp:action>
 		7) Ŀ���� �±�(Custom tag)�� ǥ�� �±� ���̺귯��(JSTL) 		
 
  --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>input</title>
</head>
<body>
	<div align="center">
		<form action="output.jsp" method="post">
			�Է� : <input type="text" name="name" size="10">
				 <input type=submit value="����">
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	 @JSP ���� ��ü 3 : session
    	1) session�� ���
    		- HTTP ���������� �񿬰��� ���������̱� ������
    		  	=> ���������� ��µ� �������� Ŭ���̾�Ʈ�� ������ ������ ������
    		  	=> ���� �ѹ� �α����� ����ڰ� �α׾ƿ��Ҷ����� �������� �̵��ص� 
    		           �����ؾ��� ������ �ִٸ� �̿� ���� ó���� �ſ� �����    		             
              	==> �̷��� HTTP �������� �������� �ذ��Ϸ��� ���� ���� : ��Ű, ����
        
        2) session�� Ư¡
            - javax.servlet.http.HttpSessionŬ������ ���� ���� ����
    		- session�� �����ϴ� ����� ���� ���� �����Ǹ�, �����ð��� �����ǰ� �Ҹ��
    		- �̷� ������ Ư¡�� �̿��� setAttribute()�� �̿��� ������ ���� ������ ���� Ȱ���� �� ����
    		- ������ �ַ� ���Ǵ� ���
    			=> ����� �α��� �� ������ �����ϰ� �����ð��� ���� ��� �ٽ� ����� ������ �䱸�Ҷ�
    			=> ���θ����� ��ٱ��� ����� �����Ҷ�
    			=> ������� ������ �̵� ���� �� �������� Ʈ��ŷ �м� ��� ���� ������ ��
    			
    	3) session�� �ֿ� �޼���
    		- setAttribute(name, attr)
    		  : ���ڿ� name���� java.lang.Object Ÿ���� attr�� ������
    		- getAttribute(attr)
    		  : ���ڿ� attr�� ������ ���� ���� java.lang.Object ���·� ��ȯ 		  
	
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session �׽�Ʈ</title>
</head>
<body>
	<div align="center">
		<h2>Session Test</h2>
		<hr />
		<%
			//������ ������ ���� �� ���� ���ӽ� �����Ǿ�, �����ð� ������
			//isNew() �޼��带 �̿��� ���� ���Ǽ����� Ȯ���غ���.
			
			if(session.isNew()){
				out.println("<script>alert('������ �����Ǿ� �ٽ� �����մϴ�.')</script>");
				//���ǿ� login�̶�� key������ "��ȣ��"�� ����
				session.setAttribute("login", "��ȣ��");
			}
		%>

		<!-- ���ǿ� ������ ���� getAttribute()�޼��带 ���� key���� ������ �� ���� -->
		<%=session.getAttribute("login") %>�� ȯ���մϴ�.<br /> 1.���� ID: &nbsp;<%=session.getId() %><br />

		<!-- �⺻ ���� ���� �ð��� 1,800��(�� 30��), setMaxInactiveInterval()�� �̿��� ���� ����-->
		2.���������ð�: &nbsp;<%=session.getMaxInactiveInterval() %>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@request : HttpServletRequest(Ŭ����)
		1) Ŭ���̾�Ʈ�� �Է��� ���� ��� ���� => ������ �б� ���� request���� �����ϴ� �޼��� ���
			- getParameter() : ���ϰ�(String)
			- getParemeterValues() : String[] => checkbox ���� �ߺ� ������ ���
			- setCharacterEncoding(): �ѱۺ�ȯ ���ڵ�	
		2) ���� ���� �б�, Ŭ���̾�Ʈ ���� Ȯ�� => request �޼��� ���
			- getRequestURL(): ��ü URL
			- getRequestURI(): IP�ּ� ������ URL
			- getContextPath(): URL ����� ���� ��
			- getRemoteAddr() : IP �ּ�
			
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ���</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String loc=request.getParameter("loc");
	String[] hobby=request.getParameterValues("hobby");
	String content=request.getParameter("content");
%>
	<div align="center">
		<h3>���� ���� ���</h3>
		<table border="1" width="400">
			<tr>
				<td width="20%">�̸�</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td width="20%">����</td>
				<td><%=gender %></td>
			</tr>
			<tr>
				<td width="20%">����</td>
				<td><%=loc %></td>
			</tr>
			<tr>
				<td width="20%">���</td>
				<td>
					<ul>
						<%
							for(String h : hobby){
						%>
								<li><%=h %></li>
						<%
							}
						%>						
					</ul>
				</td>
			</tr>
			<tr>
				<td width="20%">�ڱ�Ұ�</td>
				<td><%=content %></td>
			</tr>
		</table>
		<hr width="600">
		<h4>Ŭ���̾�Ʈ ����</h4>
		<table border="1" width="600">
			<tr>
				<td>
					<ul>
						<li>URL�ּ� : <%=request.getRequestURL() %></li>
						<li>URI�ּ� : <%=request.getRequestURI() %></li>
						<li>ContextPath : <%=request.getContextPath() %></li>
						<li>IP�ּ� : <%=request.getRemoteAddr() %></li>
					</ul>
				</td>
			</tr>
		</table>
		<hr width="600"/>
		<h4>���� ����</h4>
		<table border="1" width="600">
			<tr>
				<td>
					<ul>
						<li>�����ּ� : <%=request.getServerName() %></li>
						<li>��Ʈ��ȣ : <%=request.getServerPort() %></li>
						<li>�������� : <%=request.getProtocol() %></li>
						<li>�޼ҵ� : <%=request.getMethod() %></li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
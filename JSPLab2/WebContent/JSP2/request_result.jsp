<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Request Test Result</title>
	<%--
		@JSP ���尴ü  4: out
			1) out�� Ư¡
				- out�� ��� ��Ʈ�����ν�, ����� ���������� ����ϱ� ���� ���� ��ü
				- javax.servlet.jsp.JspWriter�� ���� ����
				- ���� ���� �޼����� ��� ���� �޼���� ������
				- out�� �̿��ؼ� ����� ������ ���� �ܼ��� �ƴ� ����ڿ��� ���޵�
			
			2) out�� �ֿ� �޼���
				- println() : content ���� ���
				- flush()	
	 --%>
	
	<%
		request.setCharacterEncoding("EUC-KR");
		
		String name=request.getParameter("name");
		String job=request.getParameter("job");
		String[] interest=request.getParameterValues("interest");	
	%>
</head>
<body>
	<center>
		<h3>Request Test Result - 1</h3>
		<hr width="400"/>
		<table border="1" width="400" cellspacing="1" cellpadding="5">
			<tr>
				<td width="30%">�̸�</td>
				<td><%out.println(name); %></td> <%-- out.println()�� <%= %>�� �����ϰ� ��� --%>
			</tr>
			<tr>
				<td width="30%">����</td>
				<td><%out.println(job);%></td>
			</tr>
			<tr>
				<td width="30%">���ɺо�</td>
				<td>
					<ul>
					<%
						if(interest!=null){
							for(String s:interest){
					%>
								<li><%out.println(s);%></li>
					<% 
							}
						}
					%>
					</ul>				
				</td>
			</tr>									
		</table>
		<hr/>
		<h2>Request Test result - 2</h2>
		<table border="0">
			<tr>
				<td>
					1.Ŭ���̾�Ʈ IP �ּ�: &nbsp;<%=request.getRemoteAddr() %><br/>
					2.��û �޼��� : &nbsp;<%=request.getMethod() %><br/>
					<%
						Cookie[] cookie=request.getCookies();
					%>
					3.<%=cookie[0].getName() %>�� ������ ��Ű�� : <%=cookie[0].getValue() %><br/>
					4.�������� : &nbsp;<%=request.getProtocol() %>
				</td>
			</tr>
		</table>
	</center>	
</body>
</html>
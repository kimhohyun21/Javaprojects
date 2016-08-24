<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	@����ġ ��Ĺ 
		- ������ ������ ���α׷�
		- �⺻���� HTTP �������� ó��
		- JSP�� ������ ������ ó��, ���� ���� 
	  	  ==> JSP�����ϱ� ���ؼ� �ݵ�� �ʿ�	  
 --%>
 
 <%--
 	@JSP ���尴ü
 		- JSP������ ������ �������� �ʰ� ����� �� �ִ� ��ü ==> ���������� �̹� ������ �Ǿ� ����
 		- JSP�� ���� ���·� �ڵ���ȯ�� �ڵ�(.java)���� ���ԵǾ� �ִ� 
 		    �������, �޼��� �Ű����� ���� ���� ��������(��ü)�� ����
 	
 	@JSP ���� ��ü 1 : request 
 		1) request�� Ư¡
 		    - HTML�� �� ����� ������ �� ���� ����� �Է������� �������� �� �� ���
 		    - javax.servlet.http.HttpServletRequestŬ������ ���� ���� ������
 		
 		2) request�� �ֿ� �޼���
 			- getParameter(name) : ���ڿ� name�� �̸��� ���� �Ű� ������ �̸��� ������
 			- getParemeterValues(name) : ���ڿ� name�� �̸��� ���� �Ű������� ���� �迭�� ���·� ������
 										 checkbox, multiple, list� �ַ� ����
 										 
            - setCharacterEncoding() : ���� JSP�� ���޵Ǵ� ������ ������ ĳ���ͼ����� ��ȯ����
            						   HTML������ �ѱ��Է��� ���������� ó�����ַ��� �ݵ�� �ʿ��� 	
            - getMethod(): ���� ��û�� GET�̳� POST���� ���� �����´�	
    
    @JSP ���� ��ü 2 : response
    	1) response�� Ư¡
    		- javax.servlet.http.HttpServletResponseŬ������ ���� ���� ������.
    		- ������� ��û�� ���� ������ ó���ϰ� �����
    
    @JSP ���� ��ü 3 : session
    	1) session�� Ư¡
    		- javax.servlet.http.HttpSessionŬ������ ���� ���� ������.
    		- Ŭ���̾�Ʈ�� ���� ������ ó���Ϸ��� �����.
  --%>
<%
	request.setCharacterEncoding("EUC-KR");
	// <name="name">
	
	String name=request.getParameter("name");	
	String gender=request.getParameter("gender");	
	String tel1=request.getParameter("tel1");	
	String tel2=request.getParameter("tel2");
	String[] hobby=request.getParameterValues("hobby");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ���</title>
</head>
<body>
	<center>
		<h3>���� ���� ���</h3>
		<table border="1" width="300">
			<tr>
				<td width="20%">�̸�</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td width="20%">����</td>
				<td><%=gender %></td>
			</tr>
			<tr>
				<td width="20%">��ȭ</td>
				<td><%=tel1+"-"+tel2 %></td>
			</tr>
			<tr>
				<td width="20%">���</td>
				<td>
					<ul>
						<%
						  if(hobby!=null){
						  	for(int i=0;i<hobby.length;i++){
					    %>
							<li><%=hobby[i]%></li>	
						<%   
						 	}
						  }
						%>		
					</ul>				
				</td>
			</tr>		
		</table>
		<hr width=300/>		
	</center>	
	<center>
		<h3>���� ���� ���</h3>
		<table border="0" width=300>		
			<tr>
				<td>
					�̸�:&nbsp;<%=name %><br/>
					����:&nbsp;<%=gender %><br/>
					��ȭ:&nbsp;<%=tel1+"-"+tel2 %><br/>
					���:
					<ul>
						<%
						 if(hobby!=null){                 //null�� �� ������ ������ �ʰ�
							 for(String s : hobby){       //for Each���� �� ȿ�����̴�
					    %>
							<li><%=s %></li>	
						<%   
							 }
						 }
						%>		
					</ul>
				</td>
			</tr>
		</table>	
	</center>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@form���� ����� �� �ִ� �Ӽ�
		1) text => name
		2) radio => ����
		3) select => ����
		4) checkbox => ���
		5) textarea => �Ұ�
		
	@���� ���
		1) GET��� (URL): output.jsp?name=aaa&hobby=bbb
			- GET ������� ������ ��� url �ڿ� ���� ���ڿ��� ������
			- �ּ� â�� Ÿ�� �����Ͱ� �Ѿ�� ������ ������ ���� ����
			- �ִ� 255�� ������ �ҿ뷮 �����͸� ������
			- GET ������� ��û�� �ϸ� doGet�޼��尡 �ڵ����� ȣ���
			
		2) POST��� (���γ�Ʈ��ũ) : name=aaa&hobby=bbb
		                       ==> �ڵ����� request.addAttribute("name", ��)������� ����
		                       ==> ����ڰ� request.getParameter("name")����  ���� ������ �� ����
	   		- html header�� Ÿ�� �����Ͱ� ������ �Ǳ� ������ ������ ����
	   		- 255�� �̻��� ��뷮 �����͸� ������
	   		- ������ ������ �̿��Ͽ� ������ �ϱ� ������ �Ķ���� ���̿� ������ ����
	   		- POST������� ��û�� �ϸ� doPost �����͸� ������	   		
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� �Է�</title>
</head>
<body>
	<div align="center">
		<h3>���� ����</h3>
		<form action="output.jsp" method="post">
			<table border="1" width="400">
				<tr>
					<td width="20%">�̸�</td>
					<td>
						<input type="text" name="name" size="10">
					</td>
				</tr>
				<tr>
					<td width="20%">����</td>
					<td>
						<input type="radio" name="gender" value="����" checked>����
						<input type="radio" name="gender" value="����">����
					</td>
				</tr>
				<tr>
					<td width="20%">����</td>
					<td>
						<select name="loc">
							<option>����</option>
							<option>���</option>
							<option>��õ</option>
							<option>����</option>
							<option>�λ�</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%">���</td>
					<td>
						<input type="checkbox" name="hobby" value="�">�
						<input type="checkbox" name="hobby" value="�뷡">�뷡
						<input type="checkbox" name="hobby" value="����">����
						<input type="checkbox" name="hobby" value="���">���
						<input type="checkbox" name="hobby" value="����">����
					</td>
				</tr>
				<tr>
					<td width="20%">�ڱ�Ұ�</td>
					<td>
						<textarea rows="5" cols="35" name="content"></textarea>
					</td>
				</tr>														
			</table>
			<table border="0" width="400">
				<tr>
					<td align="center">
						<input type="submit" value="����">
						<input type="reset" value="���">
					</td>
				</tr>	
			</table>
		</form>	
	</div>
</body>
</html>
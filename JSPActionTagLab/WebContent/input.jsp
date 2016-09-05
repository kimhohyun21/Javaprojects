<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� �Է�</title>
<%--   
	#JSP �׼� �±�(Action Tag)
		1) ����
		 	- JSP ������ �ڹ��ڵ带 ���̱� ���� ������� ���ȵ� �±�
			- �׼��±״� JSP ������ Java�ڵ� ���� Ư�� ������ ó���ϱ� ���� �±�
		
		2) ����
			- ǥ�ؾ׼� �±�: JSP Spec���� �����ϴ� ǥ�� �׼� �±�
			- Custom Tag: ����� ���� �׼� �±�
		
		3) ����
			- ����) <prefix:�±׸� �Ӽ�="value" [...]/>
			- �±״� ��ҹ��ڸ� ������
			- �Ӽ��� ���� "�Ǵ� '�� ������
			- �±״� �ݵ�� �ݾƾ���
				Ex) for each�� ��ü �±�
					<c:forEach item='list' var='mvo'></c:forEach>
				   
					getter, setter�� Ȱ���ϱ� ���� �±�
				  	<jsp:getPropoty name='cvo' property='name'/>

		4) Property��?
			- ��ü
				= �� ǥ�� : VO, DTO -> instance variable�� �߿�
				= ����(���) ���� : DAO
			- Ex)
				class StudentVO{
					private String name; 
					//private���� �����Ǿ� ������ �⺻������ �ٸ� ��ü�� ������ ���� ������ ����
					//��� GET�� SET�޼ҵ带 �����Ͽ� �ٸ� ��ü�� �������� ������ Ȱ���� �� �ְ� ��
					
					public void SetName(String name); ==> property��� ��
					String getName()				  ==> property��� ��	
				}	
		
		5) Bean�� �����ϱ� ���� �׼��±�
			- <jsp:setProperty> : java bean�� ���� setting�ϴ� �±� 
				==> bean�� Ȯ��� ������ class��� �� �� ����
				==> Ư�� ���� ��������� �Ҵ��� �� �ְ�, form tag�� �Ѿ�� Data�� �� �±׸� �ؿ��� ���� �� ����
			- <jsp:getProperty> :������Ƽ ���� �� �� ���
			- <jsp:include> :  �ٸ� �������� ���� ����� ���� �������� ���Խ�ų �� ���
			- <jsp:forword> : ������ ������ ��� �̵� ��ų �� ���
			- <jsp:useBean> : �ڹٺ��� JSP���������� ����� �� ���
 --%>
</head>
<body>
	<div align="center">
		<h3>���������Է�</h3>
		<form method="post" action="output1.jsp">
			<table border="1" width="350">
				<tr>
					<td width="20%" align="center">
						ID
					</td>
					<td>
						<input type="text" name="id" size="12">
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						�̸�
					</td>
					<td>
						<input type="text" name="name" size="12">
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						����
					</td>
					<td>
						<input type="radio" name="gender" value="��">��
						<input type="radio" name="gender" value="��">��
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						�ּ�
					</td>
					<td>
						<input type="text" name="addr" size="30">
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						��ȭ
					</td>
					<td>
						<input type="text" name="tel" size="20">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="����">
					</td>
				</tr>				
			</table>
		</form>
	</div>
</body>
</html>
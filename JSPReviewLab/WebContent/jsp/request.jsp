<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>request</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>request ���尴ü</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>request�� �ֿ� ���</h4>
					<ul class="list1">
						<li class="list_m1">��������, Ŭ���̾�Ʈ ������ ������ ����</li>
						<li class="list_m1">Ŭ���̾�Ʈ�� ��û�� ����</li>
						<li class="list_m1">�߰� ���</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					class ��
				</td>
				<td class="cont_td2">
					HttpServletRequest
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					�ֿ� �޼ҵ�
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getRemoteAddr()
				</td>
				<td class="cont_td2">
					Ŭ���̾�Ʈ�� IP���� �޾ƿ´�
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getParameter()
				</td>
				<td class="cont_td2">
					Ŭ���̾�Ʈ�� ��û�� �� �ޱ�(���� ������)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getParameterValues()
				</td>
				<td class="cont_td2">
					Ŭ���̾�Ʈ�� ��û�� �� �ޱ�(���� ������)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getRequestURI()
				</td>
				<td class="cont_td2">
					Ŭ���̾�Ʈ�� ��û�� �ּ�
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getContextPath()
				</td>
				<td class="cont_td2">
					��Ʈ����(������Ʈ��)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					setAttribute()
				</td>
				<td class="cont_td2">
					���� �߰�
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getAttribute()
				</td>
				<td class="cont_td2">
					�߰��� ������ �޾ƿ�
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					setCharacterEncoding()
				</td>
				<td class="cont_td2">
					���� ���ڵ� ����(�ѱ� : EUC-KR, UTF-8)
				</td>
			</tr>														
		</table>
	</div>
</body>
</html>
<%@page import="org.omg.CORBA.DynAnyPackage.Invalid"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>session</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>session ���尴ü</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>session�� �ֿ� ���</h4>
					<ul class="list1">
						<li class="list_m1">���� ����</li>
						<li class="list_m1">Ŭ���̾�Ʈ�� �Ϻ� ������ ������ �� �ִ�(Ŭ���̾�Ʈ ���� 1�� ����: sessionId(WebSocket))</li>
						<li class="list_m1">�ֿ� ���ó(�α���, ��ٱ���, ����)</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					class ��
				</td>
				<td class="cont_td2">
					HttpSession
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					�ֿ� �޼ҵ�
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					setAttribute()
				</td>
				<td class="cont_td2">
					���� ����
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getAttribute()
				</td>
				<td class="cont_td2">
					����� ������ ��´�(��� JSP���� ��� ����)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					invalidate()
				</td>
				<td class="cont_td2">
					����� ��� ������ ����(�α׾ƿ�)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					removeAttribute()
				</td>
				<td class="cont_td2">
					���ϴ� ������ ����(��ٱ���)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					setMaxInactiveInterval()
				</td>
				<td class="cont_td2">
					���� �Ⱓ�� ���� (30��)
				</td>
			</tr>																					
		</table>
	</div>
</body>
</html>
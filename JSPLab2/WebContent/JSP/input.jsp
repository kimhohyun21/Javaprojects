<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ����</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
		/*
		widow.onload=function(){
			
		};
		$(document).ready(function(){
			
		});
		*/
		
		$(function(){						
			$('#sendBtn').click(function(){
				var name=$('#name').val();
				if(name.trim()==""){
					alert("�̸��� �Է��ϼ���.");
					$('#name').focus();
					return;
				}
				$('#frm').submit();
			});
		});
	</script>
</head>
<body>
	<center>
		<h3>���� ���� ����</h3>
		<form action="output.jsp" method="post" id="frm">
			<!-- ������ ���ؼ��� form �±� ����� �ʼ� -->
			<table border="1" width="400">
				<tr>
					<td width="20%">�̸�</td>
					<td><input type="text" name="name" size="10" id="name">
						<!-- input�� ũ��� size�� ���� type�� image�� ���� width��� --></td>
				</tr>
				<tr>
					<td width="20%">����</td>
					<td><input type="radio" name="gender" value="��" checked>��
						<!-- ����Ʈ üũ ǥ�ô� checked �Ӽ� ��� --> <input type="radio"
						name="gender" value="��">��</td>
				</tr>
				<tr>
					<td width="20%">��ȭ��ȣ</td>
					<td><select name="tel1">
							<option>010</option>
							<option>011</option>
							<option>070</option>
					</select> <input type="text" name="tel2" size="20"></td>
				</tr>
				<tr>
					<td width="20%">���</td>
					<td><input type="checkbox" name="hobby" value="�">�
						<input type="checkbox" name="hobby" value="����">���� <input
						type="checkbox" name="hobby" value="����">���� <input
						type="checkbox" name="hobby" value="���">��� <input
						type="checkbox" name="hobby" value="����">����</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="����"
						id="sendBtn"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
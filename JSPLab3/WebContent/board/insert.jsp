<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�۾���</title>
	<script type="text/javascript">
		function send(){
			//��������==> window ==> document ==> form ==> input
			var f=document.frm;
			if(f.name.value==""){
				alert("�̸��� �Է��ϼ���");
				f.name.focus();
				return;
			}
			if(f.subject.value==""){
				alert("������ �Է��ϼ���");
				f.subject.focus();
				return;
			}
			if(f.content.value==""){
				alert("������ �Է��ϼ���");
				f.content.focus();
				return;
			}
			if(f.pwd.value==""){
				alert("��й�ȣ�� �Է��ϼ���");
				f.pwd.focus();
				return;
			}
			f.submit();
		}
	</script>
</head>
<body>
	<div align="center">
		<img src="img/write1.jpg" width="500" height="80">
		<table border="0" height="20"></table>	
		<form action="insert_ok.jsp" method="post" name="frm">
			<table border="0" width="700" id="table_content" >
				<tr height="27">
					<td width="30%" align="right">
						�̸�
					</td>
					<td width="70%" align="left">
						<input type="text" size="10" name="name">
					</td>
				</tr>
				<tr height="27">
					<td width="30%" align="right">
						�̸���
					</td>
					<td width="70%" align="left">
						<input type="text" size="45" name="email">
					</td>
				</tr>
				<tr height="27">
					<td width="30%" align="right">
						����
					</td>
					<td width="70%" align="left">
						<input type="text" size="45" name="subject">
					</td>
				</tr>
				<tr height="27">
					<td width="30%" align="right">
						����
					</td>
					<td width="70%" align="left">
						<textarea rows="10" cols="50" name="content"></textarea>
					</td>
				</tr>
				<tr height="27">
					<td width="30%" align="right">
						��й�ȣ
					</td>
					<td width="70%" align="left">
						<input type="password" size="10" name="pwd">
					</td>
				</tr>
				<tr height="27">
					<td colspan="2" align="center">
						<input type="button" value="�۾���" onclick="send()">
						<input type="button" value="���" onclick="javascript:history.back()">
					</td>
				</tr>				
			</table>
		</form>	
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�۾���</title>
	<style type="text/css">
		.tdright{
			text-align:right;
		}
		.tdcenter{
			text-align:center;
		}
	</style>
	<script type="text/javascript">
		function insert(){
			var f=document.infrm;
			if(f.name.value==""){
				alert("�̸��� �Է��ϼ���");
				f.name.focus();
				return;
			};
			if(f.subject.value==""){
				alert("������ �Է��ϼ���");
				f.subject.focus();
				return;
			};
			if(f.content.value==""){
				alert("������ �Է��ϼ���");
				f.content.focus();
				return;
			};
			if(f.pwd.value==""){
				alert("��й�ȣ�� �Է��ϼ���");
				f.pwd.focus();
				return;
			};
			f.submit();
		};
	</script>	
</head>
<body>
	<div align="center">
		<img src="img/write1.jpg" height="80" width="500">
		<table border="0" width="800" height="30"></table>
		<form action="insert_ok.jsp" method="post" name="infrm" enctype="multipart/form-data">
			<table border="0" width="800">
				<tr>
					<td class="tdright" width="30%">
						�̸�
					</td>
					<td>
						<input type="text" size="12" name="name">
					</td>
				</tr>
				<tr>
					<td class="tdright" width="30%">
						����
					</td>
					<td>
						<input type="text" size="50" name="subject">
					</td>
				</tr>
				<tr>
					<td class="tdright" width="30%">
						����
					</td>
					<td>
						<textArea rows="10" cols="50" name="content"></textArea>
					</td>
				</tr>
				<tr>
					<td class="tdright" width="30%">
						÷������
					</td>
					<td>
						<input type="file" name="file">
					</td>
				</tr>
				<tr>
					<td class="tdright" width="30%">
						��й�ȣ
					</td>
					<td>
						<input type="password" size="12" name="pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="tdcenter">
						<input type="button" value="�۾���" onclick="insert()">
						<input type="reset" value="���" onclick="javascript:history.back()">
					</td>
				</tr>			
			</table>
		</form>
	</div>
</body>
</html>
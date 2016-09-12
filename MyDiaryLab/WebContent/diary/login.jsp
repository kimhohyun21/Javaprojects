<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
		#Ŀ�ؼ� Ǯ ���� ����		
			1. Ǯ���� Ŀ�ؼ��� ������ <-----------Ǯ
					|					(Ŀ�ؼ�)
					��					(Ŀ�ؼ�)		
			2. Ŀ�ؼ��� �����				(Ŀ�ؼ�)	
					|					(Ŀ�ؼ�)	
					��					(Ŀ�ؼ�)
			3. Ŀ�ؼ��� Ǯ�� ��ȯ �� ---------->(Ŀ�ؼ�)
		
		#Ŀ�ؼ� Ǯ ���� ����
			JAVA EE (Application Server) ----> DataSource Ŭ���� ----> DataBase
											   Connection
							lookup             Connection
											   Connection
							JNDI Registry
							
		# JNDI
			1) ���� : Naming Service���� �� �ϳ�	
			2) Ư¡
				- ��ҹ��� ����
				- Ŭ������ �̸��� �ο��ϰ� �������� �����Ͽ� Ŭ������ ���		
	 --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�α���</title>
	<link rel="stylesheet" type="text/css" href="table2.css">
	<script type="text/javascript" src="jquery-3.1.0.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#loginBtn').click(function(){
				var id=$('#id').val();
				if(id.trim()==""){
					alert("ID�� �Է��ϼ���.");
					$('#id').focus();
					return;
				};
				var pwd=$('#pwd').val();
				if(pwd.trim()==""){
					alert("Password�� �Է��ϼ���.");
					$('#pwd').focus();
					return;
				}
				$('#frm').submit();
			});
		});
	</script>
</head>
<body>
	<div id="bg" align="center">
		<form action="login_ok.jsp" method="post" id="frm">
			<table id="login_table">
				<caption>LOGIN</caption>
				<tr>
					<th width="25%">
						ID
					</th>
					<td>
						<input type="text" id="id" name="id" size="15">
					</td>
				</tr>
				<tr>
					<th width="25%">
						PW
					</th>
					<td>
						<input type="password" id="pwd" name="pwd" size="15">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�α���" id="loginBtn">
						<input type="reset" value="���" id="cancelBtn">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br/>
	<div align="center" id="overlay_frm" style="display: none">
		<h3>ID�� �����ϴ�.</h3>
		<input type="button" value="Ȯ��">
	</div>
</body>
</html>
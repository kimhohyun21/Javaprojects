<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
		#커넥션 풀 실행 순서		
			1. 풀에서 커넥션을 가져옴 <-----------풀
					|					(커넥션)
					▼					(커넥션)		
			2. 커넥션을 사용함				(커넥션)	
					|					(커넥션)	
					▼					(커넥션)
			3. 커넥션을 풀에 반환 함 ---------->(커넥션)
		
		#커넥션 풀 연결 과정
			JAVA EE (Application Server) ----> DataSource 클래스 ----> DataBase
											   Connection
							lookup             Connection
											   Connection
							JNDI Registry
							
		# JNDI
			1) 개념 : Naming Service종류 중 하나	
			2) 특징
				- 대소문자 구별
				- 클래스에 이름을 부여하고 원격으로 접속하여 클래스를 사용		
	 --%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>로그인</title>
	<link rel="stylesheet" type="text/css" href="table2.css">
	<script type="text/javascript" src="jquery-3.1.0.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#loginBtn').click(function(){
				var id=$('#id').val();
				if(id.trim()==""){
					alert("ID를 입력하세요.");
					$('#id').focus();
					return;
				};
				var pwd=$('#pwd').val();
				if(pwd.trim()==""){
					alert("Password를 입력하세요.");
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
						<input type="button" value="로그인" id="loginBtn">
						<input type="reset" value="취소" id="cancelBtn">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br/>
	<div align="center" id="overlay_frm" style="display: none">
		<h3>ID가 없습니다.</h3>
		<input type="button" value="확인">
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인 정보 전송</title>
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
					alert("이름을 입력하세요.");
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
		<h3>개인 정보 전송</h3>
		<form action="output.jsp" method="post" id="frm">
			<!-- 전송을 위해서는 form 태그 사용이 필수 -->
			<table border="1" width="400">
				<tr>
					<td width="20%">이름</td>
					<td><input type="text" name="name" size="10" id="name">
						<!-- input의 크기는 size로 지정 type이 image일 때만 width사용 --></td>
				</tr>
				<tr>
					<td width="20%">성별</td>
					<td><input type="radio" name="gender" value="남" checked>남
						<!-- 디폴트 체크 표시는 checked 속성 사용 --> <input type="radio"
						name="gender" value="여">여</td>
				</tr>
				<tr>
					<td width="20%">전화번호</td>
					<td><select name="tel1">
							<option>010</option>
							<option>011</option>
							<option>070</option>
					</select> <input type="text" name="tel2" size="20"></td>
				</tr>
				<tr>
					<td width="20%">취미</td>
					<td><input type="checkbox" name="hobby" value="운동">운동
						<input type="checkbox" name="hobby" value="게임">게임 <input
						type="checkbox" name="hobby" value="낚시">낚시 <input
						type="checkbox" name="hobby" value="등산">등산 <input
						type="checkbox" name="hobby" value="독서">독서</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button" value="전송"
						id="sendBtn"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
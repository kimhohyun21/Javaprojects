<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>답글쓰기</title>
	<script type="text/javascript">
		function reply(){
			var f=document.refrm;
			if(f.name.value==""){
				alert("이름을 입력하세요.");
				f.name.focus();
				return;
			}
			if(f.subject.value==""){
				alert("제목을 입력하세요.");
				f.subject.focus();
				return;
			}
			if(f.content.value==""){
				alert("내용을 입력하세요.");
				f.content.focus();
				return;
			}
			if(f.pwd.value==""){
				alert("비밀번호를 입력하세요.");
				f.name.focus();
				return;
			}
			f.submit();
		}
	</script>
	<%
		String no=request.getParameter("no");
		String fs=request.getParameter("fs");
		String ss=request.getParameter("ss");
		if(fs==null)fs="";
		if(ss==null)ss="";
	%>
</head>
<body>
	<div align="center">
		<img src="img/reply.jpg" height="80" width="500">
		<table border="0" height="20"></table>
		<form action="reply_ok.jsp" method="post" name="refrm" id="refrm">
			<table width="700" border="0" id="reply">
				<tr height="27">
					<td align="right" width="30%">
						이름
					</td>
					<td>
						<input type="text" name="name" size="10">
						<input type="hidden" name="no" value="<%=no %>">
						<input type="hidden" name="fs" value="<%=fs %>">
						<input type="hidden" name="ss" value="<%=ss %>">
					</td>
				</tr>
				<tr height="27">
					<td align="right" width="30%">
						이메일
					</td>
					<td>
						<input type="text" name="email" size="45">
					</td>
				</tr>
				<tr height="27">
					<td align="right" width="30%">
						제목
					</td>
					<td>
						<input type="text" name="subject" size="10">
					</td>
				</tr>
				<tr height="27">
					<td align="right" width="30%">
						내용
					</td>
					<td>
						<textArea rows="10" cols="50" name="content"></textArea>
					</td>
				</tr>
				<tr height="27">
					<td align="right" width="30%">
						비밀번호
					</td>
					<td>
						<input type="password" name="pwd" size="10">
					</td>
				</tr>
				<tr height="27">
					<td colspan="2" align="center">
						<input type="button" value="답글" onclick="reply()">
						<input type="button" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
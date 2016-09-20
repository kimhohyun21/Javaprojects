<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("EUC-KR");
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");

%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>���� ���</title>
	<link rel="stylesheet" type="text/css" href="table.css">
	<script type="text/javascript" src="jquery-3.1.0.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#regBtn').click(function(){
				var subject=$('#subject').val();
				if(subject==""){
					alert('������ �Է����ּ���.');
					$('#subject').focus();
					return;
				}
				var msg=$('#msg').val();
				if(msg==""){
					alert('������ �Է����ּ���.');
					$('#msg').focus();
					return;
				}
				$('#frm').submit();
			});
		});
	</script>
</head>
<body>
	<div align="center">
		<form action="insert_ok.jsp" method="post" id="frm" name="frm">
			<table id="title_table">
				<caption>
					<font color="#570000" size="6em">���� ���</font>
				</caption>
			</table>
			<table id="insert_table">
				<tr>
					<th width="20%" align="right">����</th>
					<td>
						<input type="text" name="year" size="3" readonly="readonly" value="<%=year %>" id="year">�⵵ &nbsp;
						<input type="text" name="month" size="3" readonly="readonly" value="<%=month %>" id="month">�� &nbsp;
						<input type="text" name="day" size="3" readonly="readonly" value="<%=day %>" id="day">�� &nbsp;
					</td>
				</tr>
				<tr>
					<th width="20%" align="right">����</th>
					<td>
						<input type="text" name="subject" size="50" id="subject">
					</td>
				</tr>
				<tr>
					<th width="20%" align="right">����</th>
					<td>
						<textArea rows="10" cols="51" name="msg" id="msg"></textArea>
					</td>
				</tr>
			</table>
			<table id="btn_table">
				<tr>
					<td align="center">	
						<input type="button" value="���" id="regBtn">
						<input type="reset" value="���" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
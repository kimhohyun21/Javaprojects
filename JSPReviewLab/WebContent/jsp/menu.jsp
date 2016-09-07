<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>menu</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript">
		var i=0;
		$(function(){
			$('#objectBtn').click(function(){
				if(i==0){
					$('#object_table').show();
					i=1;
				}else{
					$('#object_table').hide();
					i=0;
				}
			});
		});
	</script>
</head>
<body>
	<table id="menu_table">
		<tr>
			<td class="menu_td">
				<a href="main.jsp?no=1">지시자</a>
			</td>
		</tr>
		<tr>
			<td class="menu_td">
				<a href="main.jsp?no=2">스크립트</a>
			</td>
		</tr>
		<tr>
			<td class="menu_td" id="objectBtn">
				<a>내장객체</a>
			</td>
		</tr>
		<tr>
			<td>
				<table id="object_table">
					<tr>
						<td class="object_td">
							<a href="main.jsp?no=3">request</a>
						</td>
					</tr>
					<tr>
						<td class="object_td">
							<a href="main.jsp?no=4">response</a>
						</td>
					</tr>
					<tr>
						<td class="object_td">
							<a href="main.jsp?no=5">session</a>
						</td>
					</tr>
					<tr>
						<td class="object_td">
							<a href="main.jsp?no=6">application</a>
						</td>
					</tr>
					<tr>
						<td class="object_td">
							<a href="main.jsp?no=7">pageContext</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="menu_td">
				<a href="main.jsp?no=8">액션 태그</a>
			</td>
		</tr>
		<tr>
			<td class="menu_td">
				<a href="main.jsp?no=9">데이터베이스</a>
			</td>
		</tr>
	</table>		
</body>
</html>
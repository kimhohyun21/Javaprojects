<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>menu</title>
</head>
<body>
	<div align="center">
		<table id="menu_table">
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=1">������(directive)</a>
				</td>
			</tr>
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=2">��ũ��Ʈ(script)</a>
				</td>
			</tr>
			<tr>
				<td class="menu_td" id="objectBtn">
					<a href="main.jsp?no=3&i=1#">���尴ü(object)</a>
				</td>
			</tr>
			<tr id="subMenu_table">
				<td>
					<table>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=3&i=1">request</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=4&i=1">response</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=5&i=1">session</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=6&i=1">application</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=7&i=1">pageContext</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=8">�׼� �±�(action tag)</a>
				</td>
			</tr>
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=9">�����ͺ��̽�(database)</a>
				</td>
			</tr>
		</table>	
	</div>	
</body>
</html>
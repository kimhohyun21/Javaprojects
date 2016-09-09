<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>pageContext</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>pageContext 내장객체</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>pageContext의 주요 기능</h4>
					<ul class="list1">
						<li class="list_m1">내장 객체 정보</li>
						<li class="list_m1">INCLUDE정보</li>
						<li class="list_m1">FORWARD(페이지 흐름 정보)</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					class 명
				</td>
				<td class="cont_td2">
					PageContext
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					주요 메소드
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					forward()
				</td>
				<td class="cont_td2">
					덮어쓰기: &lt;jsp:forward page=""&gt;
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					include()
				</td>
				<td class="cont_td2">
					부분복사: &lt;jsp:include page=""&gt;
				</td>
			</tr>																					
		</table>
	</div>
</body>
</html>
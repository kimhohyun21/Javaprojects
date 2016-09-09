<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>response</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>request 내장객체</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>response의 주요 기능</h4>
					<ul class="list1">
						<li class="list_m1">응답정보</li>
						<li class="list_m1">헤더 정보</li>
						<li class="list_m1">페이지 이동 정보</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					class 명
				</td>
				<td class="cont_td2">
					HttpServletResponse
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					주요 메소드
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					setContentType()
				</td>
				<td class="cont_td2">
					응답시 변환 코드 지정(html, xml)
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					setHeader()
				</td>
				<td class="cont_td2">
					실제 데이터보다 먼저 보내야할 데이터가 있는 경우(다운로드)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					sendRedirect()
				</td>
				<td class="cont_td2">
					서버에서 페이지 이동시 사용
				</td>
			</tr>							
		</table>				
	</div>
</body>
</html>
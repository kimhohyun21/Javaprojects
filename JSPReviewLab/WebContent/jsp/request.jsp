<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>request</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>request 내장객체</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>request의 주요 기능</h4>
					<ul class="list1">
						<li class="list_m1">서버정보, 클라이언트 정보를 가지고 있음</li>
						<li class="list_m1">클라이언트가 요청한 정보</li>
						<li class="list_m1">추가 기능</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					class 명
				</td>
				<td class="cont_td2">
					HttpServletRequest
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					주요 메소드
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getRemoteAddr()
				</td>
				<td class="cont_td2">
					클라이언트의 IP값을 받아온다
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getParameter()
				</td>
				<td class="cont_td2">
					클라이언트가 요청한 값 받기(단일 데이터)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getParameterValues()
				</td>
				<td class="cont_td2">
					클라이언트가 요청한 값 받기(다중 데이터)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getRequestURI()
				</td>
				<td class="cont_td2">
					클라이언트가 요청한 주소
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getContextPath()
				</td>
				<td class="cont_td2">
					루트폴더(프로젝트명)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					setAttribute()
				</td>
				<td class="cont_td2">
					정보 추가
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					getAttribute()
				</td>
				<td class="cont_td2">
					추가된 정보를 받아옴
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					setCharacterEncoding()
				</td>
				<td class="cont_td2">
					문자 인코딩 설정(한글 : EUC-KR, UTF-8)
				</td>
			</tr>														
		</table>
	</div>
</body>
</html>
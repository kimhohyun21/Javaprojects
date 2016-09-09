<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>application</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>application 내장객체</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>application의 주요 기능</h4>
					<ul class="list1">
						<li class="list_m1">설정 정보를 제어할 수 있음(web.xml)</li>
						<li class="list_m1">서버 정보</li>
						<li class="list_m1">자원정보(파일 그림) : Resource</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					class 명
				</td>
				<td class="cont_td2">
					SeveletContext
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					주요 메소드
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getRealPath()
				</td>
				<td class="cont_td2">
					실제 경로명을 얻어온다
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getInitParameter()
				</td>
				<td class="cont_td2">
					web.xml의 데이터를 얻어온다
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					log()
				</td>
				<td class="cont_td2">
					서버에서 error 저장	
				</td>
			</tr>																				
		</table>
	</div>
</body>
</html>
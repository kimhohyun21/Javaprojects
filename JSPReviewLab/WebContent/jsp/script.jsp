<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	# 스크립트 : 단순한 프로그램
		1) JSP : HTML+JAVA
			- <%! %> : 선언식 => 멤버변수, 메소드 선언
			- <%  %> : 스크립틀릿 => 일반자바 코드
			- <%= %> : 출력 (out.write);
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>script</title>
</head>
<body>
	<div align="center">	
		<table class="cont_table1">
			<caption>스크립트(script)의 요소</caption>
			<tr>
				<td class="cont_td1">
					&lt;%! %&gt;
				</td>
				<td class="cont_td2">
					선언식 : (변수, 메소드) => 자바빈
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					&lt;% %&gt;
				</td>
				<td class="cont_td2">
					스크립트릿 : 자바 일반 코드
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					&lt;%= %&gt;
				</td>
				<td class="cont_td2">
					표현식 : 브라우저에 데이터 출력
				</td>
			</tr>						
		</table>
	</div>
</body>
</html>
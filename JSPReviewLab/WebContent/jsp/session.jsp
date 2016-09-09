<%@page import="org.omg.CORBA.DynAnyPackage.Invalid"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>session</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>session 내장객체</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>session의 주요 기능</h4>
					<ul class="list1">
						<li class="list_m1">정보 저장</li>
						<li class="list_m1">클라이언트의 일부 정보를 저장할 수 있다(클라이언트 마다 1개 지정: sessionId(WebSocket))</li>
						<li class="list_m1">주요 사용처(로그인, 장바구니, 예매)</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					class 명
				</td>
				<td class="cont_td2">
					HttpSession
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					주요 메소드
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					setAttribute()
				</td>
				<td class="cont_td2">
					정보 저장
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					getAttribute()
				</td>
				<td class="cont_td2">
					저장된 정보를 얻는다(모든 JSP에서 사용 가능)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					invalidate()
				</td>
				<td class="cont_td2">
					저장된 모든 정보를 삭제(로그아웃)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					removeAttribute()
				</td>
				<td class="cont_td2">
					원하는 정보만 삭제(장바구니)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					setMaxInactiveInterval()
				</td>
				<td class="cont_td2">
					저장 기간을 설정 (30분)
				</td>
			</tr>																					
		</table>
	</div>
</body>
</html>
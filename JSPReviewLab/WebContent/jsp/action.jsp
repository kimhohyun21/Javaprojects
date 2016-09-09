<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>action</title>
</head>
<body>
	<div align="center">
		<table class="cont_table1">
			<caption>JSP 액션 태그 (Action Tag)</caption>
			<tr>
				<td class="cont_td2" colspan="2">
					<h4>JSP 액션 태그의 주요 기능</h4>
					<ul class="list1">
						<li class="list_m1">클래스 메모리 할당</li>
						<li class="list_m1">클라이언트가 보낸값 받기</li>
						<li class="list_m1">출력</li>
						<li class="list_m1">특정 영역에 JSP 첨부</li>
						<li class="list_m1">파일 이동</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="cont_td1" colspan="2">
					주요 태그
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					&lt;jsp:include&gt;
				</td>
				<td class="cont_td2">
					원하는 영역에 JSP첨부 (동적)
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					&lt;jsp:forward&gt;
				</td>
				<td class="cont_td2">
					페이지 이동(request를 유지)
				</td>
			</tr>							
			<tr>
				<td class="cont_td1">
					&lt;jsp:useBean&gt;
				</td>
				<td class="cont_td2">
					클래스 메모리 할당	
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					&lt;jsp:setProperty&gt;
				</td>
				<td class="cont_td2">
					클래스의 setXxxx() 호출
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					&lt;jsp:getProperty&gt;
				</td>
				<td class="cont_td2">
					클래스의 getXxxx() 호출
				</td>
			</tr>																				
		</table>
	</div>
</body>
</html>
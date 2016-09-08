<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
	# JSP
		1.순서(실행)
			1) 클라이언트 요청 ==> 주소(URL): 파일명 ==> Socket(TCP)
			2) WebServer(IIS, Apach, Tomcat): 요청값을 받는다(http)
				- 파일 찾기 (파일이 없는 경우 : 404에러)
				- html, xml(CSS, JAVA=>일반 text)==> WebServer ==> jsp ==> compile ==> interprinter
			- 브라우저에서 출력버퍼에 있는 HTML, XML을 한줄씩 읽어서 번역
 		2) 지시자(directive) <%@ 지시자명 속성=값 %>
 			1) page: jsp 파일의 시작, jsp의 정보를 가진다.
 			2) include : 특정 jsp에 다른 jsp를 첨부해서 사용 ==> 조립식
 			3) taglib : jsp에서 사용하는 태그로 된 라이브러리 사용
 						==> <c:forEach> <c:if>	
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>directive</title>
</head>
<body>
	<div align="center">		
		<table class="cont_table1">
			<caption>지시자(directive)의 종류</caption>
			<tr>
				<td class="cont_td1">
					page
				</td>
				<td class="cont_td2">
					JSP에 대한 정보(문서타입지정, 출력버퍼, 에러페이지 지정, 자바라이브러리 설정)
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					include
				</td>
				<td class="cont_td2">
					JSP의 다른 위치에 다른 JSP를 첨부
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					taglib
				</td>
				<td class="cont_td2">
					자바문법을 태그형으로 제작(XML): core, format, xml, sql, fn
				</td>
			</tr>						
		</table>
		<table class="cont_table2">
			<caption>page의 속성</caption>
			<tr>
				<td class="cont_td1">
					contentType
				</td>
				<td class="cont_td2">
					자바파일을 컴파일 후에 변환하는 파일지정<br/>
					(contentType="text/html; charset=EUC-KR(UTF-8)")<br/>	
				</td>
				<td class="cont_td3">
					text/html<br/> 
					==> charset : ISO-8859-1)<br/>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					errorPage
				</td>
				<td class="cont_td2">
					error가 있는 경우 지정하는 페이지<br/>	
				</td>
				<td class="cont_td3">
					참고(forward)<br/> 
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					import
				</td>
				<td class="cont_td2">
					자바라이브러리를 첨부할 때 사용<br/>	
				</td>
				<td class="cont_td3">
					사용법<br/>
					==> import=",": 단독으로 사용<br/>  
				</td>
			</tr>								
		</table>
		<table class="cont_table3">
			<caption>include의 속성</caption>
			<tr>
				<td class="cont_td1">
					file
				</td>
				<td class="cont_td2">
					고정으로 사용하는 JSP페이지를 설정(file="a.jsp")<br/>
				</td>
			</tr>						
		</table>
		<table class="cont_table4">
			<caption>taglib의 속성</caption>
			<tr>
				<td class="cont_td1">
					core
				</td>
				<td class="cont_td2">
					자바제어문(c:forEach, c:if, choose), URL(c:redirect), 변수설정(c:set, c:remove)<br/>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					format
				</td>
				<td class="cont_td2">
					날짜변환(fmt:formatDate), 숫자변환(fmt:formatNumber)<br/>	
				</td>
			</tr>							
		</table>
	</div>
</body>
</html>
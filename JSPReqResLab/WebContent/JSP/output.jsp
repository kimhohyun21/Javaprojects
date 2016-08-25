<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@JSP 내장 객체 재리뷰 1 : request
		1)특징
			- JSP에서 가장 많이 사용되는 기본 객체
			- 웹브라우저의 요청과 관련이 있음
			- 클라이언트가 요청한 정보를 제공하는 것이 request 기본 객체임
			- 기능 
				=> 클라이언트 (웹브라우저)와 관련된 정보 읽기 가능
				=> 서버와 관련된 정보 읽기 기능
				=> 속성 처리 가능
				
		2) 대표적인 메서드
			- setCharacterEncoding()
			- getContentType()
			- getParameter(String name)
			  => HTML 폼의 요청 파라미터 처리
			  	 : 폼에 입력한 값을 처리하는 것은 가장 많이 사용하는 기능 중에 하나
			  	       전송된 데이터를 읽어올 수 있는 메서드
			  => 존재 하지 않을 때는 null
			  
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>output</title>
</head>
<body>
	<div align="center">
		<%
			request.setCharacterEncoding("EUC-KR");
			String name=request.getParameter("name");
		%>
		<%=name %>
	</div>
</body>
</html>
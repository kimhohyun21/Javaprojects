<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	@JSP 내장객체 5: application
		1) application의 특징
			- 웹 어플이케이션(컨텍스트) 전체를 관리하는 객체
			- 일반적으로 톰캣의 시작과 종료 라이프 사이클을 가짐
			- application 객체를 통해 각 서블릿이나 JSP에서 공유라려고 하는 각종 정보를 설정, 참조할 수 있음
			- javax.servlet.ServletContext클래스(객체)의 대한 참조 변수
			- ServletContext객체는 컨체이너와 관련된 여러정보를 제공	
			
	@JSP : 데이터 유지 범위
	
  ====================================================		
	   클라이언트	                내장객체                       데이터 유지범위
  ====================================================
  	user, user2      application      Tomcat종료시까지 
  ====================================================	 
	 user2		       session          일정시간 경과 
  (각 유저 단위로 사용)                        브라우저 종료
  ====================================================
     user1		   request, request   page단위로만 유지
  (각 유저 단위로 사용) 	(page)   (page)
  ====================================================
  
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>application Test</h2>
		<hr />
		1.서버 정보 : &nbsp;<%=application.getServerInfo() %><br /> 2.서블릿 API버전 정보
		: &nbsp;<%=application.getMajorVersion()+"."+application.getMinorVersion() %><br />
		3.application.jsp 파일의 실제경로 : &nbsp;<%=application.getRealPath("application.jsp") %><br />
		<hr />
		setAttribute로 username변수에 "류성룡" 설정
		<p>
			<%
			application.setAttribute("username", "류성룡");
			application.setAttribute("count", 1);
		%>
			<a href="application_result.jsp">확인하기</a>
			<!-- 다른 페이지와 저장된 데이터를 공유하여 사용할 수 있는지 확인 -->
	</div>
</body>
</html>
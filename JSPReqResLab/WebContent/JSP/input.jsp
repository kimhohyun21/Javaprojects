<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	@웹 어플리케이션 구축을 위해 필요한 구성
		1) 웹서버 : 웹브라우저의 요청을 받아 알맞은 결과를 웹브라우저에 전송하는 역할
		2) 어플리케이션 서버 : 게시글 목록, 로그인 처리와 같은 기능을 실행하고 그 결과를 응답으로 웹서버에 저장
		3) 데이터베이스 : 웹어플리케이션이 필요로 하는 데이터 저장
			Ex) 회원 정보, 게시판 글, 데이터 등
		4) 웹 브라우저 : 웹 서버에 서비스 실행 요청, 웹서버의 처리 결과를 사용자에게 보여줌

 -->
 <%--
 	@JSP 페이지의 구성요소
 		1) 디렉티브(Directive) : <%@ %>안에 PAGE, TAGLIB, INCLUDE, import 작성
 		2) 스크립트(Script)
 			- 스크립트릿(Scriptlet) : <%자바코드 작성, 실행  %> 
 			- 표현식(Expression) : <%=값 출력 %>
 			- 선언부(Declaration): <%!메서드 선언 %>
 		3) 표현언어(Expression Language)
 		4) 기본객체(Implicit Object)
 			- request : 클라이언트의 요청 정보를 저장함
 			- response : 응답 정보를 저장함
 			- pageContext : JSP의 페이지정보를 저장
 			- session : HTTP의 세션 정보를 저장
 			- application : 웹 어플리케이션에 대한 정보
 			- out : JSP페이지가 생성하는 결과를 출력할 때 사용하는 출력스트림
 			- config : 설정정보 저장
 			- page : java.lang.Object가 원형, 자바 클래스의 인스턴스
 			- exception : 예외처리, 에러 페이지에서만 사용
 		5) 정적인 데이터
 		6) 표준 액션 태그(Action Tag): <jsp:action> </jsp:action>
 		7) 커스텀 태그(Custom tag)와 표준 태그 라이브러리(JSTL) 		
 
  --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>input</title>
</head>
<body>
	<div align="center">
		<form action="output.jsp" method="post">
			입력 : <input type="text" name="name" size="10">
				 <input type=submit value="전송">
		</form>
	</div>
</body>
</html>
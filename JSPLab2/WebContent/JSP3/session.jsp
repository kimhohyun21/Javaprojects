<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	 @JSP 내장 객체 3 : session
    	1) session의 배경
    		- HTTP 프로토콜이 비연결형 프로토콜이기 때문에
    		  	=> 한페이지가 출력된 다음에는 클라이언트와 서버의 연결이 끊어짐
    		  	=> 따라서 한번 로그인한 사용자가 로그아웃할때까지 페이지를 이동해도 
    		           보관해야할 정보가 있다면 이에 대한 처리가 매우 곤란함    		             
              	==> 이러한 HTTP 프로토콜 문제점을 해결하려고 나온 것이 : 쿠키, 세션
        
        2) session의 특징
            - javax.servlet.http.HttpSession클래스에 대한 참조 변수
    		- session은 접속하는 사용자 별로 따로 생성되며, 일정시간이 유지되고 소멸됨
    		- 이런 세션의 특징을 이용해 setAttribute()를 이용해 임의의 값을 저장해 놓고 활용할 수 있음
    		- 세션이 주로 사용되는 경우
    			=> 사용자 로그인 후 세션을 설정하고 일정시간이 지난 경우 다시 사용자 인증을 요구할때
    			=> 쇼핑몰에서 장바구니 기능을 구현할때
    			=> 사용자의 페이지 이동 동선 등 웹페이지 트래킹 분석 기능 등을 구현할 때
    			
    	3) session의 주요 메서드
    		- setAttribute(name, attr)
    		  : 문자열 name으로 java.lang.Object 타입의 attr을 설정함
    		- getAttribute(attr)
    		  : 문자열 attr로 설정된 세션 값을 java.lang.Object 형태로 반환 		  
	
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Session 테스트</title>
</head>
<body>
	<div align="center">
		<h2>Session Test</h2>
		<hr />
		<%
			//세션은 브라우저 실행 후 서버 접속시 생성되어, 일정시간 유지됨
			//isNew() 메서드를 이용해 최초 세션설정을 확인해보자.
			
			if(session.isNew()){
				out.println("<script>alert('세션이 해제되어 다시 설정합니다.')</script>");
				//세션에 login이라는 key값으로 "김호현"을 저장
				session.setAttribute("login", "김호현");
			}
		%>

		<!-- 세션에 설정된 값은 getAttribute()메서드를 통해 key값을 가져올 수 있음 -->
		<%=session.getAttribute("login") %>님 환영합니다.<br /> 1.세션 ID: &nbsp;<%=session.getId() %><br />

		<!-- 기본 세션 유지 시간은 1,800초(약 30분), setMaxInactiveInterval()을 이용해 변경 가능-->
		2.세션유지시간: &nbsp;<%=session.getMaxInactiveInterval() %>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
	1.서블릿(Servlet)과 JSP(Java Server Page)
		- 서블릿 : 자바를 이용한 서버 프로그래밍 기술	
		- 초기의 웹프로그래밍 기술 CGI(Common Gateway Interface)를  대체하기 위해서 개발 
		  ==> 느린 처리 속도, 많은 메모리 요구, 불편한 화면 제어로 한계
		  ==> PHP, ASP등 서버 스크립트 언어 등장 
		- JSP는 PHP와 유사한 형태로 HTML을 중심으로 자바프로그램과의 유기적 연결 지원
		- JSP와 서블릿의 차이
		  : JSP는 HTML과 같은 일반적인 텍스트 파일 구조
		  	서블릿은 자바 소스로 작성된 클래스 파일 구조
		  	
    2.JSP의 특징
     	- 자바의 모든 기능을 사용할 수 있음.
     	- 서블릿으로 컴파일된 후(==> .java, .class로 됨) 메모리에서 처리되기 때문에
     	    많은 사용자의 접속도 원활히 처리 가능함
     	- 빈즈(Beans)라고 하는 자바 컴포넌트를 사용할 수 있음 
     	- 커스텀 태그를 만들어서 사용할 수 있으며, JSTL(JSP Standard Tag Library)과 같은
     	    태그 라이브러리를 이용할 수 있음
     	- 스트러츠, 스프링@MVC등 다양한 프레임워크와 결합해서 개발 가능
     	
     	
    3. JSP 학습에 필요한 기술
    	- JSP는 웹프로그래밍 기술로 HTML, JS, CSS와 같은 기본 웹프로그래밍 경험이 요구됨.
    	- JSP는 자바언어 기반이며, 개발시 순수 자바 코드가 50%이상 탄탄한 자바 기본기가 요구됨.
    	- 이외 추가적인 기술들에 대한 경험 => 고급 웹프로그래밍에 도움이 됨.
    	  : DATABASE, XML, FRAMEWORK,ANDROID, IOS 들
   
    4. JSP의 전체적인 동작과정 
    	- JSP는  HTML과 유사한 처리 과정을 거치나 HTML은 단순 서버파일을 브라우저로 보내주는 것에 비해
    	  JSP는 서버에서 프로그램이 실행된 결과를 웹브라우저로 전달하는 차이가 있음.
    	- JSP는 서블릿 컨테이너에 의해 서블릿 형태의 자바 소스로 변환되어 클래스로 컴파일 됨.
   
    5. JSP 정리
    	- JSP는 일반 텍스트 파일로 되어 있다.
    	  (텍스트 파일은 컴퓨터가 이해할 수 없음. 즉, JSP파일 자체는 실행가능한 프로그램이 아니고 특정 동작을 할 수 없음)
    	- JSP는 HTML 코드와 몇몇 특수한 태그, 그리고 자바 코드가 섞여있음.
		- 사용자가 요청할 경우 JSP는 컨테이너(톰캣)에 의해서 서블릿 형태의 .java 소스로 변환되고 컴파일 됨.
		- 컴파일된 .class는 컴퓨터에서 실행할 수 있는 형태로 특정 기능을 수행함.
		- 이후 소스 전까지는 해당 파일은 메모리에 상주하면서 재컴파일 되지않고 서비스된
			    	
 	@ JSP의 전체 동작 과정
 							
 							
 				----------DNS 서버   	  
    	        |   |                                                                                                                                        
    	  1)URL입력    2)IP주소로 변환
    			|   |                         4) JSP 서블릿 내부 처리
    		     web   ----3)JSP페이지 요청------ 웹서버(8080 port) 
    		   Browser ----5) HTML웹페이지 응답---(Servlet Container)
    	    			
-->

<%-- 
	1) 지시자 (<%@ 지시자명 속성="값" 속성="값"..... %>
	   page 
	   	- contentType="text/html(xml); charset=euc-kr / UTF-8
	   	- import="java.util.*, java.text.*"
	   	- errorPage="파일명"
	   ========================================================
	   include
	   	- file="파일명"
	   taglib
	    - prefix="c" / "core"
	    - url="경로명"
	    
	2)JSP 사용법
		- JSP ==> HTML + JAVA : 서로 구분이 되어 표기
		- 스크립트 릿
			<%
				//일반 자바 코딩
			%> 
		- 선언식
			<%! 
				//메소드
				//멤버변수
			%>
		- 표현식
			<%=
			 	//값
			%>
			
	3) 내장 객체 : request, response, session....
	4) 액션 태그 : <jsp:useBean>, <jsp:setProperty>
	5) JSTL : <c:forEach..>, <c:if>, EL => ${}

 --%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
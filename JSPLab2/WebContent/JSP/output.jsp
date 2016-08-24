<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	@아파치 톰캣 
		- 일종의 웹서버 프로그램
		- 기본적인 HTTP 프로토콜 처리
		- JSP와 서블릿의 컴파일 처리, 실행 가능 
	  	  ==> JSP실행하기 위해서 반드시 필요	  
 --%>
 
 <%--
 	@JSP 내장객체
 		- JSP내에서 별도로 선언하지 않고 사용할 수 있는 객체 ==> 내부적으로 이미 선언이 되어 있음
 		- JSP가 서블릿 형태로 자동변환된 코드(.java)내에 포함되어 있는 
 		    멤버변수, 메서드 매개변수 등의 각종 참조변수(객체)를 말함
 	
 	@JSP 내장 객체 1 : request 
 		1) request의 특징
 		    - HTML의 폼 요소의 선택한 값 등의 사용자 입력정보를 읽으려고 할 때 사용
 		    - javax.servlet.http.HttpServletRequest클래스에 대한 참조 변수임
 		
 		2) request의 주요 메서드
 			- getParameter(name) : 문자열 name과 이름이 같은 매개 변수의 이름을 가져옴
 			- getParemeterValues(name) : 문자열 name과 이름이 같은 매개변수의 값을 배열의 형태로 가져옴
 										 checkbox, multiple, list등에 주로 사용됨
 										 
            - setCharacterEncoding() : 현재 JSP로 전달되는 내용을 지정한 캐릭터셋으로 변환해줌
            						   HTML폼에서 한글입력을 정상적으로 처리해주려면 반드시 필요함 	
            - getMethod(): 현재 요청이 GET이나 POST형태 인지 가져온다	
    
    @JSP 내장 객체 2 : response
    	1) response의 특징
    		- javax.servlet.http.HttpServletResponse클래스에 대한 참조 변수임.
    		- 사용자의 요청에 대한 응답을 처리하고 사용함
    
    @JSP 내장 객체 3 : session
    	1) session의 특징
    		- javax.servlet.http.HttpSession클래스에 대한 참조 변수임.
    		- 클라이언트의 세션 정보를 처리하려고 사용함.
  --%>
<%
	request.setCharacterEncoding("EUC-KR");
	// <name="name">
	
	String name=request.getParameter("name");	
	String gender=request.getParameter("gender");	
	String tel1=request.getParameter("tel1");	
	String tel2=request.getParameter("tel2");
	String[] hobby=request.getParameterValues("hobby");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인 정보 출력</title>
</head>
<body>
	<center>
		<h3>개인 정보 출력</h3>
		<table border="1" width="300">
			<tr>
				<td width="20%">이름</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td width="20%">성별</td>
				<td><%=gender %></td>
			</tr>
			<tr>
				<td width="20%">전화</td>
				<td><%=tel1+"-"+tel2 %></td>
			</tr>
			<tr>
				<td width="20%">취미</td>
				<td>
					<ul>
						<%
						  if(hobby!=null){
						  	for(int i=0;i<hobby.length;i++){
					    %>
							<li><%=hobby[i]%></li>	
						<%   
						 	}
						  }
						%>		
					</ul>				
				</td>
			</tr>		
		</table>
		<hr width=300/>		
	</center>	
	<center>
		<h3>개인 정보 출력</h3>
		<table border="0" width=300>		
			<tr>
				<td>
					이름:&nbsp;<%=name %><br/>
					성별:&nbsp;<%=gender %><br/>
					전화:&nbsp;<%=tel1+"-"+tel2 %><br/>
					취미:
					<ul>
						<%
						 if(hobby!=null){                 //null일 때 에러가 나오지 않게
							 for(String s : hobby){       //for Each문이 더 효율적이다
					    %>
							<li><%=s %></li>	
						<%   
							 }
						 }
						%>		
					</ul>
				</td>
			</tr>
		</table>	
	</center>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Request Test Result</title>
	<%--
		@JSP 내장객체  4: out
			1) out의 특징
				- out은 출력 스트림으로써, 사용자 웹브라우저로 출력하기 위한 내장 객체
				- javax.servlet.jsp.JspWriter의 참조 변수
				- 버퍼 관련 메서드의 출력 관련 메서드로 구성됨
				- out을 이용해서 출력한 내용은 서버 콘솔이 아닌 사용자에게 전달됨
			
			2) out의 주요 메서드
				- println() : content 내용 출력
				- flush()	
	 --%>
	
	<%
		request.setCharacterEncoding("EUC-KR");
		
		String name=request.getParameter("name");
		String job=request.getParameter("job");
		String[] interest=request.getParameterValues("interest");	
	%>
</head>
<body>
	<center>
		<h3>Request Test Result - 1</h3>
		<hr width="400"/>
		<table border="1" width="400" cellspacing="1" cellpadding="5">
			<tr>
				<td width="30%">이름</td>
				<td><%out.println(name); %></td> <%-- out.println()는 <%= %>과 동일하게 출력 --%>
			</tr>
			<tr>
				<td width="30%">직업</td>
				<td><%out.println(job);%></td>
			</tr>
			<tr>
				<td width="30%">관심분야</td>
				<td>
					<ul>
					<%
						if(interest!=null){
							for(String s:interest){
					%>
								<li><%out.println(s);%></li>
					<% 
							}
						}
					%>
					</ul>				
				</td>
			</tr>									
		</table>
		<hr/>
		<h2>Request Test result - 2</h2>
		<table border="0">
			<tr>
				<td>
					1.클라이언트 IP 주소: &nbsp;<%=request.getRemoteAddr() %><br/>
					2.요청 메서드 : &nbsp;<%=request.getMethod() %><br/>
					<%
						Cookie[] cookie=request.getCookies();
					%>
					3.<%=cookie[0].getName() %>에 설정된 쿠키값 : <%=cookie[0].getValue() %><br/>
					4.프로토콜 : &nbsp;<%=request.getProtocol() %>
				</td>
			</tr>
		</table>
	</center>	
</body>
</html>
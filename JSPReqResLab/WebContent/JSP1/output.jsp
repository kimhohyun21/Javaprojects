<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@request : HttpServletRequest(클래스)
		1) 클라이언트가 입력한 값을 묶어서 전송 => 정보를 읽기 위해 request에서 제공하는 메서드 사용
			- getParameter() : 단일값(String)
			- getParemeterValues() : String[] => checkbox 같이 중복 선택할 경우
			- setCharacterEncoding(): 한글변환 인코딩	
		2) 서버 정보 읽기, 클라이언트 정보 확인 => request 메서드 사용
			- getRequestURL(): 전체 URL
			- getRequestURI(): IP주소 이후의 URL
			- getContextPath(): URL 경로의 폴더 명
			- getRemoteAddr() : IP 주소
			
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인 정보 출력</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String loc=request.getParameter("loc");
	String[] hobby=request.getParameterValues("hobby");
	String content=request.getParameter("content");
%>
	<div align="center">
		<h3>개인 정보 출력</h3>
		<table border="1" width="400">
			<tr>
				<td width="20%">이름</td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td width="20%">성별</td>
				<td><%=gender %></td>
			</tr>
			<tr>
				<td width="20%">지역</td>
				<td><%=loc %></td>
			</tr>
			<tr>
				<td width="20%">취미</td>
				<td>
					<ul>
						<%
							for(String h : hobby){
						%>
								<li><%=h %></li>
						<%
							}
						%>						
					</ul>
				</td>
			</tr>
			<tr>
				<td width="20%">자기소개</td>
				<td><%=content %></td>
			</tr>
		</table>
		<hr width="600">
		<h4>클라이언트 정보</h4>
		<table border="1" width="600">
			<tr>
				<td>
					<ul>
						<li>URL주소 : <%=request.getRequestURL() %></li>
						<li>URI주소 : <%=request.getRequestURI() %></li>
						<li>ContextPath : <%=request.getContextPath() %></li>
						<li>IP주소 : <%=request.getRemoteAddr() %></li>
					</ul>
				</td>
			</tr>
		</table>
		<hr width="600"/>
		<h4>서버 정보</h4>
		<table border="1" width="600">
			<tr>
				<td>
					<ul>
						<li>서버주소 : <%=request.getServerName() %></li>
						<li>포트번호 : <%=request.getServerPort() %></li>
						<li>프로토콜 : <%=request.getProtocol() %></li>
						<li>메소드 : <%=request.getMethod() %></li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
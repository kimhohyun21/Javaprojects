<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	내장 객체(기본 객체)
		1. request : HttpServletRequest
			1) 클라이언트의 요청 정보
				- setCharactorEncoding()
			  	- getParameter(): 단일데이터
			  		=> id=aaa&gender=man&name=jung
			  	- getParameters(): 다중데이터
			  		=> hobby=aaa&hobby=bbb&hobby=ccc
			2) 클라이언트 브라우저 정보
				- http://localhost/JSPLab/JSP2/info.jsp
				  => getrequestURL()
				- /JSPLab/JSP2/info.jsp
				  => getrequestURI()
				- /JSPLab
				  => getContextPath()
				  => getMethod()
				  => getRemoteAddr()
			
			3) 서버 정보 
				- getServerName()
				- getServerPort()
				- getProtocol()
				
			4) session, cookie 생성 기능
				- getSession(), getCookie()
			
		2. 그 외
			1) response
			2) session
			3) out
			4) application
			5) pageContext
			6) page
			7) config
			8) exception
			
 -->		
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>Request 정보</h3>
		클라이언트 IP : <%=request.getRemoteAddr() %> <br/>
		URL: <%=request.getRequestURL() %><br/>
		URI: <%=request.getRequestURI() %><br/>
		method: <%=request.getMethod() %><br/>
		protocol: <%=request.getProtocol() %><br/>
		ServerName: <%=request.getServerName() %><br/>
		ServerPort: <%=request.getServerPort() %><br/>
		ContextPath: <%=request.getContextPath() %>
		
		<%--
			http://localhost:8080/JSPLab/JSP2/info.jsp
			====   =========     =====================
		protocol   ServerName    URI	
		 --%>
		
	</center>
</body>
</html>
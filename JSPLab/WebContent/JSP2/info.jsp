<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
	���� ��ü(�⺻ ��ü)
		1. request : HttpServletRequest
			1) Ŭ���̾�Ʈ�� ��û ����
				- setCharactorEncoding()
			  	- getParameter(): ���ϵ�����
			  		=> id=aaa&gender=man&name=jung
			  	- getParameters(): ���ߵ�����
			  		=> hobby=aaa&hobby=bbb&hobby=ccc
			2) Ŭ���̾�Ʈ ������ ����
				- http://localhost/JSPLab/JSP2/info.jsp
				  => getrequestURL()
				- /JSPLab/JSP2/info.jsp
				  => getrequestURI()
				- /JSPLab
				  => getContextPath()
				  => getMethod()
				  => getRemoteAddr()
			
			3) ���� ���� 
				- getServerName()
				- getServerPort()
				- getProtocol()
				
			4) session, cookie ���� ���
				- getSession(), getCookie()
			
		2. �� ��
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
		<h3>Request ����</h3>
		Ŭ���̾�Ʈ IP : <%=request.getRemoteAddr() %> <br/>
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
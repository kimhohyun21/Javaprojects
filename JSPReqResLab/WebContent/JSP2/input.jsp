<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@jSp의 실행 과정
		input.jsp =======> input_jsp.java
					 	   ============== java의 main()에서 실행되는 것처럼 작동
					 	   ___jspInit() 실행
					 	   while(true){
					 	   
					 	   		__jspService() if(POST) else(GET) Thread(run)
					 	   		=> doPost, doGet	
					 	   
					 	   }
					 	   __jspDestroy() : 새로고침, 페이지 이동(메모리 해제)		
 --%>
<%--
	@페이지(파일) 이동
		1) HTML : <a href="">, <form action="">
		2) JavaScript : location
		3) JAVA : sendRedirect, forward
		   Ex) insert.jsp ==> insert_ok.jsp 의 경우
		   	   ==> sendRedirect("insert_ok.jsp")
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<a href="forward.jsp?id=admin">전송</a>
	</div>
</body>
</html>
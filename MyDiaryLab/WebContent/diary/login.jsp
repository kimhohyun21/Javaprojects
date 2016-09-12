<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<%--
		#커넥션 풀 실행 순서		
			1. 풀에서 커넥션을 가져옴 <-----------풀
					|					(커넥션)
					▼					(커넥션)		
			2. 커넥션을 사용함				(커넥션)	
					|					(커넥션)	
					▼					(커넥션)
			3. 커넥션을 풀에 반환 함 ---------->(커넥션)
		
		#커넥션 풀 연결 과정
			JAVA EE (Application Server) ----> DataSource 클래스 ----> DataBase
											   Connection
							lookup             Connection
											   Connection
							JNDI Registry
							
		# JNDI
			1) 개념 : Naming Service종류 중 하나	
			2) 특징
				- 대소문자 구별
				- 클래스에 이름을 부여하고 원격으로 접속하여 클래스를 사용		
	 --%>
</head>
<body>

</body>
</html>
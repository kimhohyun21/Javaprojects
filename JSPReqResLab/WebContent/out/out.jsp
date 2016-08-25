<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@내장객체(기본 객체)
		1) request(*****)
			- 클래스 : HttpServletRequest
			- 클라이언트가 요청한 값을 가지고 있음. Map형식
			  Ex) GET 방식 : a.jsp?id=admin&pwd=1234 
			  	  POST 방식 : id=admin&pwd=1234 : 별도로 전송 
			  	  			==> 묶어서 사용할 수 있게 전송
			  	  				request.addAttribute("id", "admin)
			  	  				request.addAttribute("pwd", "1234")
			  	  			==> __jspService(): 클라이언트가 요청시 마다 자동호출(톰캣) <== 프로그래머가 JSP 코딩
		
		2) response(****)
			 - 응답정보
			 - 페이지 이동 정보 : sendRedirect("list.jsp?page=1") ==> GET방식
		
		3) out : JspWriter
			- 화면 출력 : print, println
			- 버퍼(출력) 관리 : setBufferSize() ==> 기본 8KB, 변경 가능
			- 새로고침 : clear(), flush() ==> 자동으로 처리되고 있음 : autoFlush=true
		
		4) application(****): ServeletContext
			- 서버정보 : getRealPath()
			- 로그정보 : log()
			- web.xml 제어 : getInitParameter()==> DB(url,username,password) 확인 	  		
 --%>			
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
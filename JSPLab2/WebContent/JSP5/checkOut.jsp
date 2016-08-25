<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<%
		request.setCharacterEncoding("EUC-KR");
		
	%>
<title>계산</title>
</head>
<body>
	<div align="center">
		<h2>계산</h2>
		<%=session.getAttribute("name") %>님이 로그인되었습니다.<br/>
		선택한 상품 목록
		<hr/>
		<%
			ArrayList list=(ArrayList)session.getAttribute("productList");
		
			if(list==null){
				out.println("<script>alert('선택한 상품이 없습니다.')</script>");
				out.println("<script>history.go(-1)</script>");
			}else{
				for(Object productName : list){
					out.println(productName+"<br/>");
				}
			}
		%>
	</div>
</body>
</html>
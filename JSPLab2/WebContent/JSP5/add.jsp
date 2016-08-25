<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>물건담기</title>
	<%
		request.setCharacterEncoding("EUC-KR");
		
		String productName=request.getParameter("product");				
		
		ArrayList<String> list=(ArrayList)session.getAttribute("productList");
		list.add(productName);			
	%>
</head>
<body>
	<script type="text/javascript">
		alert("<%=productName %>가(이) 추가되었습니다!")
		history.go(-1)
	</script>
</body>
</html>
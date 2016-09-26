<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품선택</title>
<%
		request.setCharacterEncoding("EUC-KR");	
			
		if(request.getParameter("name").length()==0){
			out.println("<script>alert('아이디를 입력해주세요.')</script>");
			out.println("<script>history.go(-1)</script>");
		}

		session.setAttribute("name",request.getParameter("name")); 
		//로그아웃하기 전에는 페이지가 바뀌어도 name은 변하지 않음
		
		String username=session.getAttribute("name").toString();		
		if(request.isRequestedSessionIdFromURL()){
			out.println("<script>alert('"+username.toString()+"님이 로그인되었습니다.')</script>");
		}
		
		ArrayList<String> list=new ArrayList<>();
		session.setAttribute("productList", list); //속성 값을 리스트로 적용도 가능		
	%>
</head>
<body>
	<div align="center">
		<h2>상품선택</h2>
		<%=username %>님이 로그인되었습니다.
		<hr />
		<form name="form2" method="post" action="add.jsp">
			<select name="product">
				<option>사과</option>
				<option>귤</option>
				<option>파인애플</option>
				<option>자몽</option>
				<option>레몬</option>
			</select> <input type="submit" value="선택">
		</form>
		<a href="checkOut.jsp">계산</a>
	</div>
</body>
</html>
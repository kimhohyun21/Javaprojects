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
		
		/* 선생님 답
		//==> Array 리스트에 productList의 세션 값을 가져오는데 이 값이 널이면 새로 생성하고 다시 셋해준다.
		ArrayList<String> list=(ArrayList)session.getAttribute("productList");
		
		if(list==null){
			list=new ArrayList<>();
			session.setAttribute("productList", list); // list를 그대로 속성 값으로 반영 가능
		}
		*/
		
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
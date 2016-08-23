<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int i, evensum=0, oddsum=0;
		for(i=1;i<=10;i++){
			if((i%2)==0){
				evensum+=i;
			}else{
				oddsum+=i;
			}
		}
	%>
	짝수의 합 : <%=evensum %> <br/>
	홀수의 합 : <%=oddsum %>
</body>
</html>
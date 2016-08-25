<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Twitter Test</title>
	<%
		request.setCharacterEncoding("EUC-KR");
		String id=request.getParameter("id");		
		
		if(id!=null){
			session.setAttribute("user", id);
		}

		String user=(String)session.getAttribute("user");
		ArrayList<String> list=(ArrayList)application.getAttribute("contentList");
	%>
</head>
<body>
	<div align="center">
		<h2>My Simple Twitter!!</h2>
		<hr/>		
		<form action="tweet.jsp" method="post" name="frm2">
			@<%=user %>
			<input type="text" name="cont" size="20">
			<input type="submit" value="tweet">
		</form>
		<hr/>
		<table border="0" width="600">
			<tr>
				<td>
					<ul>
						<%
							if(list!=null){
								for(String msg : list){							
						%>
								<li><%=msg %></li>
						<%
								}
							}
						%>
					</ul>
				</td>
			</tr>
		</table>		
	</div>
</body>
</html>
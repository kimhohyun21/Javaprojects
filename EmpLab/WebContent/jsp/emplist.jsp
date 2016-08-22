<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	EmpDAO dao=EmpDAO.newInstance();
	ArrayList<EmpVO> list=dao.empAllData();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>사원목록</h3>
		<table border=0 width=450>
		<tr bgcolor=#ccccff>
			<th>사번</th>
			<th>이름</th>
			<th>직위</th>
			<th>입사일</th>
		</tr>
		<%
			for(EmpVO vo:list){
		%>
			<tr>
				<td><%=vo.getEmpno() %></td>      <!-- jsp파일은 java와 html을 동시에 작성이 가능함 -->
				<td><%=vo.getEname() %></td>
				<td><%=vo.getJob() %></td>
				<td><%=vo.getHiredate() %></td>
			</tr>
		<%
			}
		%>
		</table>
		<hr width=450/>
	</center>
</body>
</html>
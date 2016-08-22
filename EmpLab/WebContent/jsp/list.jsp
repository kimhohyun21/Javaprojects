<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.dao.*"%> <!-- java에 필요한 부분 import -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	EmpDAO dao=EmpDAO.newInstance();
	
	ArrayList<EmpVO> list=dao.empAllData();
	
	out.write("<html>");
	out.write("<body>");
	out.write("<center>");
	out.write("<h3>사원목록</h3>");
	out.write("<table border=0 width=450>");
	out.write("<tr bgcolor=#ccccff>");
	out.write("<th>사번</th>");
	out.write("<th>이름</th>");
	out.write("<th>직위</th>");
	out.write("<th>입사일</th>");
	out.write("</tr>");
	
	for(EmpVO vo : list){
		out.write("<tr>");
		out.write("<td>"+vo.getEmpno()+"</td>");
		out.write("<td><a href=EmpDetailServlet?empno="+vo.getEmpno()+">"+vo.getEname()+"</a></td>");
		out.write("<td>"+vo.getJob()+"</td>");
		out.write("<td>"+vo.getHiredate().toString()+"</td>");
		out.write("</tr>");
	}
	
	out.write("</table>");
	out.write("<hr width=450/>");
	out.write("</center>");
	out.write("</body>");
	out.write("</html>");
	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>글 상세보기</title>
	<style type="text/css">
		.table1{
			margin-top: 30px;
			margin-bottom: 10px;
			border-top: 2px solid black;
			border-bottom: 2px solid black;
		}
		.centerGray{
			background-color: gray;
			text-align: center; 
		}
		.center{
			text-align: center;
		}
	</style>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
	String no=request.getParameter("no");
	DataBoardDAO dao=new DataBoardDAO();
	DataBoardVO vo=dao.contentDetail(no);
%>
<body>
	<div align="center">
		<img src="img/content.jpg" height="80" width="500">
		<table border="0" width="800" class="table1">
			<tr>
				<td width="20%" class="centerGray">
					번호
				</td >
				<td width="30%" class="center">
					<%=vo.getNo() %>
				</td>
				<td width="20%" class="centerGray">
					작성일
				</td >
				<td width="30%" class="center">
					<%=vo.getRegDate() %>
				</td>
			</tr>
			<tr>
				<td width="20%" class="centerGray">
					이름
				</td >
				<td width="30%" class="center">
					<%=vo.getName() %>
				</td>
				<td width="20%" class="centerGray">
					조회수
				</td >
				<td width="30%" class="center">
					<%=vo.getHit() %>
				</td>
			</tr>
			<tr>
				<td width="20%" class="centerGray">
					제목
				</td>
				<td colspan="3">
					<%=vo.getSubject() %>
				</td>
			</tr>
			<tr>
				<td width="20%" class="centerGray">
					첨부파일
				</td>
				<td colspan="3">
					<a href="download.jsp?no=<%=vo.getNo() %>"><%=vo.getFilename() %>(<%=vo.getFilesize() %>)</a>
				</td>
			</tr>
			<tr height="300">
				<td colspan="4" valign="top">
					<br/>
					<%=vo.getContent() %>
				</td>
			</tr>
		</table>
		<table border="0" width="800">
			<tr align="right">
				<td>
					<a href="modify.jsp?no=<%=no %>"><img src="img/modify.gif"></a>
					<a href="delete.jsp?no=<%=no %>"><img src="img/delete.gif"></a>
					<a href="list.jsp"><img src="img/list.gif"></a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
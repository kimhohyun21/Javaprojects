<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dao" class="com.sist.dao.DiaryDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	Object name=session.getAttribute("name");
	if(name==null){
		out.write("<script>alert('세션이 종료되었습니다.');</script>");
		out.write("<script>location.href='login.jsp';</script>");
	};
	
	String id=String.valueOf(session.getAttribute("id"));	
	String strPage=request.getParameter("page");
	if(strPage==null){ strPage="1"; }
	int curPage=Integer.parseInt(strPage);
	
	List<DiaryVO> list=dao.totalContent(id, curPage);	
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>diary</title>
	<link rel="stylesheet" type="text/css" href="table2.css">
	<script type="text/javascript" src="jquery-3.1.0.js"></script>
	<script type="text/javascript">
	</script>
</head>
<body>
	<div align="center">
		<div id="diary_bg">
			<table id="title_table">
			<caption id="title_cap">My Diary</caption>
				<tr>
					<td>
						<a href="insert.jsp"><img src="">글쓰기</a>
					</td>
				</tr>	
			</table>
			<table id="diary_table">
				<tr>
					<th width="10%">
						No
					</th>
					<th width="40%">
						제목
					</th>
					<th width="10%">
						년
					</th>
					<th width="5%">
						월
					</th>
					<th width="5%">
						일
					</th>
					<th width="30%">
						등록일
					</th>
				</tr>
			<%
				for(DiaryVO vo : list){
			%>
				<tr class="cont_tr">
					<td width="10%" class="center_td">
						<%=vo.getNo() %>
					</td>
					<td width="40%">
						<%=vo.getSubject() %>
					</td>
					<td width="10%" class="center_td">
						<%=vo.getYear() %>
					</td>
					<td width="5%" class="center_td">
						<%=vo.getMonth() %>
					</td>
					<td width="5%" class="center_td">
						<%=vo.getDay() %>
					</td>
					<td width="20%" class="center_td">
						<%=vo.getRegDate() %>
					</td>
				</tr>
			<%
				}
			%>
			</table>
		</div>
	</div>
</body>
</html>
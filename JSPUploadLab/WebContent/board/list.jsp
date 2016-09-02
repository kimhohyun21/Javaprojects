<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>데이터 게시판 리스트</title>
</head>
<%
	request.setCharacterEncoding("EUC-KR");
	String strPage=request.getParameter("page");
	if(strPage==null)strPage="1";
	int curPage=Integer.parseInt(strPage);
	
	DataBoardDAO dao=new DataBoardDAO();
	List<DataBoardVO> list=new ArrayList<>();
	list=dao.dataBoardListData(curPage);
	
	int totalPage=dao.countTotalPage();
	int count=dao.countRow();
	int num=count-((curPage*10)-10);
%>
<body>
	<div align="center">
		<img src="img/board.jpg" height="80" width="500">
		<table border="0" width="800">
			<tr>
				<td colspan="5" align="left" id="table_content">
					<a href="insert.jsp"><img src="img/bt_write.jpg"></a>
				</td>
			</tr>
			<tr>
				<th width="10%" align="center">번호</th>
				<th width="40%" align="center">제목</th>
				<th width="10%" align="center">이름</th>
				<th width="30%" align="center">작성일</th>
				<th width="10%" align="center">조회수</th>				
			</tr>
		<% 
			for(DataBoardVO vo : list){
				String color="white";
				if(num%2==0){
					color="pink";
				}else{
					color="white";
				}
		%>
			<tr bgcolor=<%=color %> id="dataTr">
				<td width="10%" align="center" class="tdCenter"><%=num-- %></td>
				<td width="40%" class="tdLeft">
					<a href="content.jsp?page=<%=curPage %>&no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
				</td>
				<td width="10%" align="center" class="tdCenter"><%=vo.getName() %></td>
				<td width="30%" align="center" class="tdCenter"><%=vo.getRegDate() %></td>
				<td width="10%" align="center" class="tdCenter"><%=vo.getHit() %></td>
			</tr>
		<%
			}
		%>
			<tr>
				<td colspan="5" align="right">
					<!-- 삼항연산자를 이용한 페이지 이동 설정 -->
					<a href="list.jsp?page=<%=curPage>1?curPage-1 : curPage %>"><img src="img/btn_pagePrev.gif"></a>
				<% 
					for(int i=1;i<=totalPage;i++){
				%>
					<a href="list.jsp?page=<%=i %>">[<%=i %>]</a>
				<%						
					}
				%>
					<a href="list.jsp?page=<%=curPage<totalPage?curPage+1 : curPage %>"><img src="img/btn_pagePrev.gif"></a> 
					&nbsp;&nbsp; <%=curPage %> page / <%=totalPage %> pages
				</td>
			</tr>
		</table>	
	</div>
</body>
</html>
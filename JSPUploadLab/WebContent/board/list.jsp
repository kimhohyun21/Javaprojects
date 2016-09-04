<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>데이터 게시판 리스트</title>
	<style type="text/css">
		#title_img{
			height: 100px; 
			width: 500px;
		}
		table{
			border: 0px; 
			width: 800px;
		}
		#btn_table{
			text-align: left;
		}
		#content_table{	
			border-top: 2px solid black;
			border-bottom: 2px solid black;
			border-collapse: collapse;
			background-color: ivory;		
		}
		#page_table{
			text-align: right;
		}
		th{
			background-color: #cccfff;
			border-bottom: 1px solid gray;
			border-left: 1px solid gray;
			text-align:center;
			font-weight:bolder;
		}
		th:NTH-CHILD(1){
			border-left: none;
		}
		#cont_tr:hover{
			background-color: #f5f5f5;
		}
		#cont_tr:NTH-CHILD(odd){
			background-color: pink;
		}
		.cont_td{
			text-align: center;
			border-left: 1px solid gray;
		}
		.cont_td:NTH-CHILD(1){
			border-left: none;
		}
		.cont_td:NTH-CHILD(2) {
			text-align: left;
			padding-left:5px;
		}
		a{
			text-decoration: none;
			color: black;
		}
		a:hover{
			text-decoration: underline;
			color: green;
		}
	</style>
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
	int count=dao.countRow(null);
	int num=count-((curPage*10)-10);
%>
<body>
	<div align="center">
		<img src="img/board.jpg" id="title_img">
		<table id="btn_table">
			<tr>
				<td>
					<a href="insert.jsp"><img src="img/bt_write.jpg"></a>
				</td>
			</tr>
		</table>
		<table id="content_table">
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="10%">이름</th>
				<th width="30%">작성일</th>
				<th width="10%">조회수</th>				
			</tr>
		<% 
			for(DataBoardVO vo : list){
		%>
			<tr id="cont_tr">
				<td width="10%" class="cont_td"><%=num-- %></td>
				<td width="40%" class="cont_td">
					<a href="content.jsp?page=<%=curPage %>&no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
				</td>
				<td width="10%" class="cont_td"><%=vo.getName() %></td>
				<td width="30%" class="cont_td"><%=vo.getRegDate() %></td>
				<td width="10%" class="cont_td"><%=vo.getHit() %></td>
			</tr>
		<%
			}
		%>
		</table>
		<table id="page_table">
			<tr>
				<td>
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
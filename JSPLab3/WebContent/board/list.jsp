<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.dao.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String strPage=request.getParameter("page");
	if(strPage==null){
		strPage="1";
	}
	int curPage=Integer.parseInt(strPage);
	
	BoardDAO dao=new BoardDAO();
	List<BoardVO> list=dao.boardListData(curPage);
	int totalPage=dao.boardTotalPage();
	int count=dao.boardRowCount();
	count=count-((curPage*10)-10);
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>리스트 페이지</title>
	<style type="text/css">
		td, th{
			font-family: "맑은 고딕";
			font-size: 9pt
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
<body>
	<div align="center">
		<img src="img/board.jpg" height="80" width="500">
		<table width="700" border="0" id="insert">
			<tr>
				<td align="left">
					<a href="insert.jsp"><img src="img/bt_write.jpg" border="0"></a>
				</td>
			</tr>
		</table>
		<table border="0" width="700" id="table_content">
			<tr bgcolor="#ccccff" height="2">
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="15%">이름</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		<%
			int i=0;
			String color="white";
			for(BoardVO vo : list){
				if(i%2==0) color="white"; else color="#cccccf";
		%>
			<tr bgcolor="<%=color %>" height="27" id="dataTr">
				<td width="10%" align="center">				
					<%=count-- %>				
				</td>				
				<td width="45%" align="left">				
					<%
						if(vo.getGroup_tab()!=0){
							for(int j=0;j<vo.getGroup_tab();j++){
								out.write("&nbsp;&nbsp;");
							}
					%>
							<img src="img/icon_reply.gif">&nbsp;	
					<%							
						}
						
						String msg="관리자에 의해 삭제된 게시물입니다.";
						if(msg.equals(vo.getSubject())){
							
					%>
							<span style="color:gray;cusor:default">
							<%=vo.getSubject() %></span>
					<%
						}else{	
					%>
						<a href="content.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
					<%
						}
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
						String today=sdf.format(new Date());
						String dbday=vo.getRegDate().toString();
						//2016-08-26
						
						if(today.equals(dbday)){
					%>				
						<sup><img src="img/new.gif"></sup>
					<%
						}
					%>
				</td>
				<td width="15%" align="center">				
					<%=vo.getName() %>				
				</td>
				<td width="20%" align="center">				
					<%=vo.getRegDate().toString() %>				
				</td>
				<td width="10%" align="center">				
					<%=vo.getHit() %>				
				</td>
			</tr>
		<% 	
				i++;
			}
		%>
		</table>
		<table border="0" width="700" id="table_footer">
			<tr>
				<td align="left">
					<form action="find.jsp" method="post" id="ff">
						Search:
						<select name="fs">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="ss" id="ss" size="20">
						<input type="button" value="찾기" id="findBtn">
						<span id="print">
							
						</span>
					</form>	
				</td>
				<td align="right">
					<img src="img/btn_pageFirst.gif">
					<img src="img/btn_pagePrev.gif">
					<%						
						for(i=1;i<=totalPage;i++){		
					%>
						<a href="main.jsp?page=<%=i %>"><%=i %></a>						
					<%
						}
					%>
					<img src="img/btn_pageNext.gif">
					<img src="img/btn_pageLast.gif">
					&nbsp;&nbsp;
					<%=curPage %>page / <%=totalPage %>pages
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
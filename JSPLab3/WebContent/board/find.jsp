<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*, java.text.*, java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	String strPage=request.getParameter("fpage");
	if(strPage==null){
		strPage="1";
	}
	int curPage=Integer.parseInt(strPage);	
	
	String fs=request.getParameter("fs");
	String ss=request.getParameter("ss");
	
	String method = request.getMethod();
	System.out.println(method);
	if(method.equals("GET")){
		ss=new String(ss.getBytes("UTF-8"), "UTF-8");
		System.out.println(ss);
	}	
	
	BoardDAO dao=new BoardDAO();
	List<BoardVO> flist=dao.contentFind(fs, ss, curPage);
	
	int totalPage=dao.findTotalPage(fs, ss);
	int count=dao.findRowCount(fs, ss);
	count=count-((curPage*10)-10);
	
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#findBtn').click(function(){
				var ss=$('#ss').val();
				
				$('#print').html("");
				
				if(ss==""){
					$('#print').html("<font color=red>검색어를 입력하세요.</font>");
					$('#ss').focus();
					return;
				}
				$('#ff').submit();			
			})
		});
		//자바스크립트 경고창 방법
		/* function find(){
			var f=document.ff;
			if(f.ss.value==""){
				alert("검색어를 입력하세요.");
				f.ss.focuse();
				return;
			}
			f.submit();
		} */
	</script>
</head>
<body>
	<div align="center">
	<img src="img/board.jpg" height="80" width="500">
		<table width="700" border="0" id="insert">
			<tr>
				<td align="left" width="30%">
					<a href="main.jsp?content=1"><img src="img/bt_write.jpg" border="0"></a>
					<td align="right">검색된 내용 <%=count %>개</td>
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
			for(BoardVO vo : flist){
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
						<a href="main.jsp?no=<%=vo.getNo()%>"><%=vo.getSubject() %></a>
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
					<form action="main.jsp?fpage=1&fs=<%=fs %>" method="post" id="ff" name="ff">
						Search:
						<select name="fs">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="ss" id="ss" size="20">
						<input type="button" value="찾기" id="findBtn" onclick="find()">
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
						<a href="main.jsp?fpage=<%=i %>&fs=<%=fs %>&ss=<%=ss %>">[<%=i %>]</a>						
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	
	request.setCharacterEncoding("UTF-8");
	
	String strPage=request.getParameter("page");	
	if(strPage==null){
		strPage="1";
	}
	int curPage=Integer.parseInt(strPage);	
	
	String fs=request.getParameter("fs");
	String ss=request.getParameter("ss");
	
	if(fs==null)fs="";
	if(ss==null)ss="";
	
	int totalPage;
	int count;
	BoardDAO dao=new BoardDAO();
	List<BoardVO> list=new ArrayList<>();
	
	String display="none";
	if(fs=="" && ss==""){		
		list=dao.boardListData(curPage);
		totalPage=dao.boardTotalPage();
		count=dao.boardRowCount();
		display="none";
	}else{
		list=dao.contentFind(fs, ss, curPage);		
		totalPage=dao.findTotalPage(fs, ss);
		count=dao.findRowCount(fs, ss);
		display="inherit";
	}
		
	int num=count-((curPage*10)-10);
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
		#count{
			display: <%=display %>;
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
	</script>
</head>
<body>
	<div align="center">
		<a href="main.jsp">
			<img src="img/board.jpg" height="80" width="500">
		</a>
		<table width="700" border="0" id="insert">
			<tr>
				<td align="left" width="30%">
					<a href="main.jsp?insert=1"><img src="img/bt_write.jpg" border="0"></a>
				</td>
				<td align="right" style="color:red"><span id="count">검색된 내용 <%=count %>개</span></td>
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
					<%=num-- %>				
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
						<a href="main.jsp?page=<%=curPage %>&no=<%=vo.getNo()%>&fs=<%=fs %>&ss=<%=ss %>"><%=vo.getSubject() %></a>
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
					<form method="get" id="ff" name="ff"> <!-- 찾기 했을 때 현재 list로 값을 다시 받아주기 위해 action 삭제 get방식으로 변경  -->
						<input type="hidden" name="page" value="1"> <!-- page 값도 파라미터로 넘기기 위해 hidden으로 설정  -->
						Search:
						<select name="fs">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="ss" id="ss" size="20">
						<input type="button" value="찾기" id="findBtn"> <!-- js로 작성할 경우 onclick="find()" 부여 -->
						<span id="print"></span> <!-- 검색어 입력 하라는 경고 문구를 jquery혹은 js로 작성하여 출력하는 공간 -->
					</form>	
				</td>
				<td align="right">
					<a href="main.jsp?page=1">
						<img src="img/btn_pageFirst.gif">
					</a>
					<% 
						int prevPage=curPage-1;
						if(prevPage<=0)prevPage=1;
					%>
					<a href="main.jsp?page=<%=prevPage %>&fs=<%=fs %>&ss=<%=ss%>">
						<img src="img/btn_pagePrev.gif">
					</a>
					<%						
						for(i=1;i<=totalPage;i++){		
					%>
						<a href="main.jsp?page=<%=i %>&fs=<%=fs %>&ss=<%=ss%>">[<%=i %>]</a>						
					<%
						} 
						int nextPage=curPage+1;
						if(nextPage>=totalPage)nextPage=totalPage;
					%>
					<a href="main.jsp?page=<%=nextPage %>&fs=<%=fs %>&ss=<%=ss%>">
						<img src="img/btn_pageNext.gif">
					</a>
					<a href="main.jsp?page=<%=totalPage %>&fs=<%=fs %>&ss=<%=ss%>">
						<img src="img/btn_pageLast.gif">
					</a>					
					&nbsp;&nbsp;
					<%=curPage %>page / <%=totalPage %>pages
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
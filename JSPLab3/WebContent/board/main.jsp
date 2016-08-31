<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커뮤니티 게시판</title>
</head>
<body>
	<div align="center">
		<table border="1" bordercolor="black" width="900" height="700">
			<tr>
				<td colspan="2" height="100">
					&nbsp;
				</td>		
			</tr>
			<tr>
				<td width="200" height="500">
					&nbsp;
				</td>				
				<td width="700" height="500" align="center" valign="top">					
			<%
				//GET 방식 에러로 EUC-KR ==> UTF-8로 변경			
				request.setCharacterEncoding("UTF-8");
				
				//jsp:include를 위한 파라미터 지정 
				String insert=request.getParameter("insert"); // 글쓰기 				
				String update=request.getParameter("update"); //수정하기
				String reply=request.getParameter("reply");// 답글달기
				String no=request.getParameter("no"); // 상세보기
				String fs=request.getParameter("fs"); //검색 인자 
				String ss=request.getParameter("ss"); //검색 값
			
				if(insert!=null){
			%>
					<jsp:include page="insert.jsp"></jsp:include>
			<%
				}else if(update!=null){
			%>
					<jsp:include page="update.jsp"></jsp:include>
			<%
				}else if(reply!=null){
			%>
					<jsp:include page="reply.jsp"></jsp:include>
			<%
				}else if(no!=null){
			%>
					<jsp:include page="content.jsp"></jsp:include>	
			<%
				}else{
			%>
					<jsp:include page="list.jsp"></jsp:include>
			<%
				}					
			%>	
				</td>
			</tr>
			<tr>
				<td colspan="2" height="100">
					&nbsp;
				</td>
			</tr>		
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.dao.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>상세보기</title>
	<style type="text/css">
		td, th{
			font-family: "맑은 고딕";
			font-size: 10pt
		}
		
		.td{
			background-color:#cccccf;
			font-weight:bold;
			text-align:center;
		}		
		a:hover{
			opacity: 0.3; 
			filter: alpha(opacity=30);
		}		
		#del{
			display:none;
		}		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript">
		var i=0;
		$(function(){
			$('#delBtn').click(function(){ //토글 형태의 기능 구현
				if(i==0){
					$('#del').show();
					i=1;
				}else{
					$('#del').hide();
					i=0;
				}				
			})
			$('#delButton').click(function(){
				var pwd=$('#pwd').val();
				if(pwd==""){
					$('#print').html("<font color=red>비밀번호를 입력하세요</font>")
					$('#pwd').focus();
					return;
				}
				$('#delFrm').submit();
			})		
		});		
	</script>
</head>
<body>
	<%
		String no=request.getParameter("no");
		String fs=request.getParameter("fs");
		String ss=request.getParameter("ss");
		
		BoardDAO dao=new BoardDAO();
		BoardVO vo=new BoardVO();
		vo=dao.contentDetail(no, 1);
		
		int countno=dao.coutNo(no);
	%>
	<div align="center">
		<img src="img/content.jpg" height="80" width="500">
		<table border="0" height="20"></table>	
		<table border="0" width="700" id="dtable">
			<tr height="27">
				<td width="20%" class="td">
					번호
				</td>
				<td width="30%" align="center">
					<%=countno %>
				</td>
				<td width="20%" class="td">
					작성일
				</td>
				<td width="30%" align="center">
					<%=vo.getRegDate().toString() %>
				</td>
			</tr>
			<tr height="27">
				<td width="20%" class="td">
					이름
				</td>
				<td width="30%" align="center">
					<%=vo.getName() %>
				</td>
				<td width="20%" class="td">
					조회수
				</td>
				<td width="30%" align="center">
					<%=vo.getHit() %>
				</td>
			</tr>
			<tr height="27">
				<td width="20%" class="td">
					제목
				</td>
				<td colspan="3">
					<%=vo.getSubject() %>
				</td>
			</tr>
			<tr height="220">
				<td colspan="4" valign="top">
					<br/>
					<%=vo.getContent() %>
				</td>
			</tr>
		</table>
		<table border="0" width="700" id="btable">
			<tr height="27">
				<td colspan="4" align="right">
					<a href="reply.jsp?no=<%=vo.getNo()%>"><img src="img/reply.gif" border="0"></a>
					<a href="main.jsp?update=1&no=<%=vo.getNo()%>&fs=<%=fs %>&ss=<%=ss %>"><img src="img/modify.gif" border="0"></a>
					<a><img src="img/delete.gif" border="0" id="delBtn"></a>
					<a href="main.jsp"><img src="img/list.gif" border="0"></a>
				</td>
			</tr>
			<tr height="40" id="del">
				<td align="right">
					<span id="print"></span>
					<form action="delete.jsp" method="post" id="delFrm">
						비밀번호 : <input type="password" name="pwd" id="pwd" size="10">
								<input type="hidden" name="no" value="<%=vo.getNo() %>">
								<input type="button" value="삭제" id="delButton">
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
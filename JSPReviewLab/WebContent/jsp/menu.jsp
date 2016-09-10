<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.jsp.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<!-- 페이지 전환 부드럽게 -->
	<META http-equiv="Page-Enter" content="BlendTrans(Duration=0.5)"> 
	<META http-equiv="Page-exit" content="BlendTrans(Duration=0.5)">
	<title>menu</title>
<%
	request.setCharacterEncoding("EUC-KR");
	
	//메뉴바에서 서브 메뉴 숨김을 자연스럽게 하기 위한 파라미터 설정 
	//==> css가 js보다 우선순위가 높음
	String j=request.getParameter("i");
	if(j==null){j="0";}
	int i=Integer.parseInt(j);
	
	if(i==0){	
%>
	<style type="text/css">
		#subMenu_table{display: none;}
	</style>
<% 
	}else{ 
%>
	<style type="text/css">
		#subMenu_table{display: inherit;}
	</style>
<%	
	}
%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript">
		var i=<%=i %>;		
		$(function(){			
			//마우스 클릭 이벤트
			$('#object_td').click(function(){
				if(i==0){
					$('#subMenu_table').css('display', 'inherit');
					//페이지 전환효과가 심해서 삭제 location.href='main.jsp?no=3&i=1'; 
					i=1;
				}else{
					$('#subMenu_table').css('display', 'none');
					//페이지 전환효과가 심해서 삭제 location.href='main.jsp?no=3&i=0';
					i=0;
				};
			});
			
			//마우스 오버 이벤트
			$('#objectBtn').mouseover(function(){
				if(i==0){
					$('#subMenu_table').css('display', 'inherit');
					i=1;					
				}else{
					$('#subMenu_table').css('display', 'none');
					i=0;
				}
			});	
		});
	</script>	
</head>
<body>
	<form action="" method="get" id="Frm">
		<input type="hidden" name="i" value="">
	</form>
	<div align="center">
		<table id="menu_table">
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=1">지시자(directive)</a> <%-- &i=<%=i %> 파라미터 삭제 --%>
				</td>
			</tr>
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=2">스크립트(script)</a> <%-- &i=<%=i %> 파라미터 삭제 --%>
				</td>
			</tr>
			<tr>
				<td class="menu_td" id="object_td">
					<a id="objectBtn">내장객체(object)</a>
				</td>
			</tr>
			<tr id="subMenu_table">
				<td>
					<table>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=3&i=1">request</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=4&i=1">response</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=5&i=1">session</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=6&i=1">application</a>
							</td>
						</tr>
						<tr>
							<td class="subMenu_td">
								<a href="main.jsp?no=7&i=1">pageContext</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=8">액션 태그(action tag)</a> <%-- &i=<%=i %> 파라미터 삭제 --%>
				</td>
			</tr>
			<tr>
				<td class="menu_td">
					<a href="main.jsp?no=9">데이터베이스(database)</a> <%-- &i=<%=i %> 파라미터 삭제 --%>
				</td>
			</tr>
		</table>	
	</div>	
</body>
</html>
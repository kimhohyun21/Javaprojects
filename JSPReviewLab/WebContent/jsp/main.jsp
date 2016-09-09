<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.jsp.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>JSP(Model 1) Summary</title>	
<%
	request.setCharacterEncoding("EUC-KR");

	//main.jsp?no=1 ������ ���� �Ķ���Ϳ� �Լ�
	String no=request.getParameter("no");
	if(no==null){no="0";};
	String jsp=JSPChange.change(Integer.parseInt(no));
	
	//�޴��ٿ��� ���� �޴� ������ �ڿ������� �ϱ� ���� �Ķ���� ���� 
	//==> css�� js���� �켱������ ����
	String i=request.getParameter("i");
	if(i==null){i="0";}
	
	if(i=="0"){
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
	<link rel="stylesheet" type="text/css" href="table.css">
	<script src="js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		var i=<%=i %>;
		$(document).ready(function(){
			$('#objectBtn').click(function(){
				if(i==0){
					$('#subMenu_table').show();
					i=1;
				}else{
					$('#subMenu_table').hide();
					i=0;
				}
			});		
		});
	</script>	
</head>
<body>
	<div align="center">
		<table id="content_table">
			<tr>
				<td id="title" colspan="2">
					<a href="main.jsp" class="a">JSP(Model 1) Summary</a>
				</td>
			</tr>
			<tr>
				<td id="menu">
					<jsp:include page="menu.jsp"></jsp:include>
				</td>
				<td id="content">
					<jsp:include page="<%=jsp %>"></jsp:include>
				</td>
			</tr>
			<tr>
				<td id="footer" colspan="2">
					<address>&copy;2016 SIST ����� ������ ����� 18 ��ȭ���� �ֿ밭�ϱ�������</address>
				</td>
				
			</tr>	
		</table>		
	</div>	
</body>
</html>
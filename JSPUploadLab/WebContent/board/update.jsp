<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>글 수정하기</title>
	<style type="text/css">
		#title_img{
			height: 100px;
			width: 500px;
		}
		table{
			border: 0px;
			width: 800px;
			border-collapse: collapse;
		}
		#content_table{
			margin-top: 30px;
			margin-bottom: 10px;
			border-top: 2px solid black;
			border-bottom: 2px solid black;
			background-color: ivory;
		}
		td{
			padding: 3px;
			padding-right: 20px;
			border-bottom: 1px solid black;
		}
		.title_td{
			text-align: right;
			border-right: 1px solid black;
			background-color: pink;
			font-weight: bolder;
		}
		#btn_td{
			border: 0px;
			text-align: center;			
		}
		
	</style>
	<script type="text/javascript">
		function update(){
			var f=document.upfrm;
			if(f.name.value==""){
				alert('이름을 입력해주세요.');
				f.name.focus();
				return;
			}
			if(f.subject.value==""){
				alert('제목을 입력해주세요.');
				f.subject.focus();
				return;
			}
			if(f.content.value==""){
				alert('내용을 입력해주세요.');
				f.content.focus();
				return;
			}
			if(f.pwd.value==""){
				alert('이름을 입력해주세요.');
				f.pwd.focus();
				return;
			}
			f.submit();
		}
	</script>
</head>
<%
    request.setCharacterEncoding("EUC-KR");
	String no=request.getParameter("no");
	String curPage=request.getParameter("page");
	DataBoardDAO dao=new DataBoardDAO();
	DataBoardVO vo=dao.contentDetail(no, 2);
%>
<body>
	<div align="center">
		<img src="img/update.jpg" id="title_img">
		<form action="update_ok.jsp?page=<%=curPage %>&no=<%=no %>" method="post" name="upfrm" enctype="multipart/form-data">
			<table id="content_table">
				<tr>
					<td width="30%" class="title_td">
						이름
					</td>
					<td>
						<input type="text" name="name" size="12"value=<%=vo.getName() %>>
					</td>
				</tr>
				<tr>
					<td width="30%" class="title_td">
						제목
					</td>
					<td>
						<input type="text" name="subject" size="50" value=<%=vo.getSubject() %>>
					</td>
				</tr>
				<tr>
					<td width="30%" class="title_td">
						내용
					</td>
					<td>
						<textarea rows="10" cols="50" name="content"><%=vo.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td width="30%" class="title_td">
						첨부파일
					</td>
					<td>
						<input type="file" name="file">
					</td>
				</tr>
				<tr>
					<td width="30%" class="title_td">
						비밀번호
					</td>
					<td>
						<input type="password" name="pwd" size="12">
					</td>
				</tr>			
			</table>
			<table>
				<tr>
					<td id="btn_td">
						<input type="button" value="수정" onclick="update()">
						<input type="reset" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
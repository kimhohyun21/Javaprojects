<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>글쓰기 게시판</title>
	<style type="text/css">
		th, td{
			font-familly: 맑은고딕;
			font-size: 9pt;
		}
		
		a{
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
	<center>
		<img alt="" src="../img/title.gif">
		<p>
		<table border="0" width="600">
			<tr>
				<td align="left">
					<a href="board_write.html">
						<img alt="" src="../img/bt_write.jpg" border="0">
					</a>
				</td>
			</tr>
		</table>
		<table border="0" width="600">
			<tr bgcolor="ccccff" height="27"> 								<!-- 제목 행 -->
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="15%">이름</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>								
			</tr>
			<tr bgcolor="ivory" height="27"> 								<!-- 1번째 내용 행 -->
				<td width="10%" align="center">3</td>
				<td width="45%" align="left">
					<a href="board_content.html">HTML 연습용 게시판 만들기</a>
				</td>
				<td width="15%" align="center">정도전</td>
				<td width="20%" align="center">2016-08-18</td>
				<td width="10%" align="center">5</td>
			</tr>
			<tr bgcolor="ivory" height="27">								<!-- reply 내용 행 -->
				<td width="10%" align="center">2</td>
				<td width="45%" align="left">
					&nbsp;&nbsp;<img alt="" src="../img/icon_reply.gif"> 	<!-- &nbsp; 1칸 들여쓰기 -->
					<a href="board_content.html">HTML 연습용 게시판 만들기</a>
					<sup><img alt="" src="../img/new.gif"></sup>			<!-- sup : 윗첨자 부분에 이미지,텍스트 등 표시  / sub : 아랫첨자 -->
				</td>
				<td width="15%" align="center">정도전</td>
				<td width="20%" align="center">2016-08-18</td>
				<td width="10%" align="center">5</td>
			</tr>
			<tr bgcolor="ivory" height="27">								<!-- reply의 reply 내용 행 -->
				<td width="10%" align="center">1</td>
				<td width="45%" align="left">
					&nbsp;&nbsp;&nbsp;&nbsp;								<!-- 들여쓰기 추가 -->						
					<img alt="" src="../img/icon_reply.gif"> 			
					<a href="board_content.html">HTML 연습용 게시판 만들기</a>
					<sup><img alt="" src="../img/new.gif"></sup>					
				</td>
				<td width="15%" align="center">정도전</td>
				<td width="20%" align="center">2016-08-18</td>
				<td width="10%" align="center">5</td>
			</tr>			
		</table>
		
		<hr width="600"/>
		
		<table border="0" width="600">
			<tr>															
				<td align="left">											<!-- 검색 창 테이블 행의 첫번째 열-->		
					search: 
					<select>												<!-- 선택 옵션 -->		
						<option>이름</option>
						<option>제목</option>
						<option>내용</option>
					</select>
					<input type="text" size="10">
					<input type="button" value="찾기">
				</td>
				<td align="right">											<!-- 검색 창 테이블 행의 두번째 열-->
					<img alt="" src="../img/btn_pageFirst.gif">
					<img alt="" src="../img/btn_pagePrev.gif">
					[1][2][3][4][5]
					<img alt="" src="../img/btn_pageNext.gif">
					<img alt="" src="../img/btn_pageLast.gif">
					&nbsp;&nbsp;
					1page/5page
				</td>				
			</tr>
		</table>
	</center>
</body>
</html>
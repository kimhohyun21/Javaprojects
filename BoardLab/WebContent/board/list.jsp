<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�۾��� �Խ���</title>
	<style type="text/css">
		th, td{
			font-familly: �������;
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
			<tr bgcolor="ccccff" height="27"> 								<!-- ���� �� -->
				<th width="10%">��ȣ</th>
				<th width="45%">����</th>
				<th width="15%">�̸�</th>
				<th width="20%">�ۼ���</th>
				<th width="10%">��ȸ��</th>								
			</tr>
			<tr bgcolor="ivory" height="27"> 								<!-- 1��° ���� �� -->
				<td width="10%" align="center">3</td>
				<td width="45%" align="left">
					<a href="board_content.html">HTML ������ �Խ��� �����</a>
				</td>
				<td width="15%" align="center">������</td>
				<td width="20%" align="center">2016-08-18</td>
				<td width="10%" align="center">5</td>
			</tr>
			<tr bgcolor="ivory" height="27">								<!-- reply ���� �� -->
				<td width="10%" align="center">2</td>
				<td width="45%" align="left">
					&nbsp;&nbsp;<img alt="" src="../img/icon_reply.gif"> 	<!-- &nbsp; 1ĭ �鿩���� -->
					<a href="board_content.html">HTML ������ �Խ��� �����</a>
					<sup><img alt="" src="../img/new.gif"></sup>			<!-- sup : ��÷�� �κп� �̹���,�ؽ�Ʈ �� ǥ��  / sub : �Ʒ�÷�� -->
				</td>
				<td width="15%" align="center">������</td>
				<td width="20%" align="center">2016-08-18</td>
				<td width="10%" align="center">5</td>
			</tr>
			<tr bgcolor="ivory" height="27">								<!-- reply�� reply ���� �� -->
				<td width="10%" align="center">1</td>
				<td width="45%" align="left">
					&nbsp;&nbsp;&nbsp;&nbsp;								<!-- �鿩���� �߰� -->						
					<img alt="" src="../img/icon_reply.gif"> 			
					<a href="board_content.html">HTML ������ �Խ��� �����</a>
					<sup><img alt="" src="../img/new.gif"></sup>					
				</td>
				<td width="15%" align="center">������</td>
				<td width="20%" align="center">2016-08-18</td>
				<td width="10%" align="center">5</td>
			</tr>			
		</table>
		
		<hr width="600"/>
		
		<table border="0" width="600">
			<tr>															
				<td align="left">											<!-- �˻� â ���̺� ���� ù��° ��-->		
					search: 
					<select>												<!-- ���� �ɼ� -->		
						<option>�̸�</option>
						<option>����</option>
						<option>����</option>
					</select>
					<input type="text" size="10">
					<input type="button" value="ã��">
				</td>
				<td align="right">											<!-- �˻� â ���̺� ���� �ι�° ��-->
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
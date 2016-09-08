<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
	# JSP
		1.����(����)
			1) Ŭ���̾�Ʈ ��û ==> �ּ�(URL): ���ϸ� ==> Socket(TCP)
			2) WebServer(IIS, Apach, Tomcat): ��û���� �޴´�(http)
				- ���� ã�� (������ ���� ��� : 404����)
				- html, xml(CSS, JAVA=>�Ϲ� text)==> WebServer ==> jsp ==> compile ==> interprinter
			- ���������� ��¹��ۿ� �ִ� HTML, XML�� ���پ� �о ����
 		2) ������(directive) <%@ �����ڸ� �Ӽ�=�� %>
 			1) page: jsp ������ ����, jsp�� ������ ������.
 			2) include : Ư�� jsp�� �ٸ� jsp�� ÷���ؼ� ��� ==> ������
 			3) taglib : jsp���� ����ϴ� �±׷� �� ���̺귯�� ���
 						==> <c:forEach> <c:if>	
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>directive</title>
</head>
<body>
	<div align="center">		
		<table class="cont_table1">
			<caption>������(directive)�� ����</caption>
			<tr>
				<td class="cont_td1">
					page
				</td>
				<td class="cont_td2">
					JSP�� ���� ����(����Ÿ������, ��¹���, ���������� ����, �ڹٶ��̺귯�� ����)
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					include
				</td>
				<td class="cont_td2">
					JSP�� �ٸ� ��ġ�� �ٸ� JSP�� ÷��
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					taglib
				</td>
				<td class="cont_td2">
					�ڹٹ����� �±������� ����(XML): core, format, xml, sql, fn
				</td>
			</tr>						
		</table>
		<table class="cont_table2">
			<caption>page�� �Ӽ�</caption>
			<tr>
				<td class="cont_td1">
					contentType
				</td>
				<td class="cont_td2">
					�ڹ������� ������ �Ŀ� ��ȯ�ϴ� ��������<br/>
					(contentType="text/html; charset=EUC-KR(UTF-8)")<br/>	
				</td>
				<td class="cont_td3">
					text/html<br/> 
					==> charset : ISO-8859-1)<br/>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					errorPage
				</td>
				<td class="cont_td2">
					error�� �ִ� ��� �����ϴ� ������<br/>	
				</td>
				<td class="cont_td3">
					����(forward)<br/> 
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					import
				</td>
				<td class="cont_td2">
					�ڹٶ��̺귯���� ÷���� �� ���<br/>	
				</td>
				<td class="cont_td3">
					����<br/>
					==> import=",": �ܵ����� ���<br/>  
				</td>
			</tr>								
		</table>
		<table class="cont_table3">
			<caption>include�� �Ӽ�</caption>
			<tr>
				<td class="cont_td1">
					file
				</td>
				<td class="cont_td2">
					�������� ����ϴ� JSP�������� ����(file="a.jsp")<br/>
				</td>
			</tr>						
		</table>
		<table class="cont_table4">
			<caption>taglib�� �Ӽ�</caption>
			<tr>
				<td class="cont_td1">
					core
				</td>
				<td class="cont_td2">
					�ڹ����(c:forEach, c:if, choose), URL(c:redirect), ��������(c:set, c:remove)<br/>
				</td>
			</tr>
			<tr>
				<td class="cont_td1">
					format
				</td>
				<td class="cont_td2">
					��¥��ȯ(fmt:formatDate), ���ں�ȯ(fmt:formatNumber)<br/>	
				</td>
			</tr>							
		</table>
	</div>
</body>
</html>
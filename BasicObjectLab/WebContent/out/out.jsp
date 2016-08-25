<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@���尴ü(�⺻ ��ü)
		1) request(*****)
			- Ŭ���� : HttpServletRequest
			- Ŭ���̾�Ʈ�� ��û�� ���� ������ ����. Map����
			  Ex) GET ��� : a.jsp?id=admin&pwd=1234 
			  	  POST ��� : id=admin&pwd=1234 : ������ ���� 
			  	  			==> ��� ����� �� �ְ� ����
			  	  				request.addAttribute("id", "admin)
			  	  				request.addAttribute("pwd", "1234")
			  	  			==> __jspService(): Ŭ���̾�Ʈ�� ��û�� ���� �ڵ�ȣ��(��Ĺ) <== ���α׷��Ӱ� JSP �ڵ�
		
		2) response(****)
			 - ��������
			 - ������ �̵� ���� : sendRedirect("list.jsp?page=1") ==> GET���
		
		3) out : JspWriter
			- ȭ�� ��� : print, println
			- ����(���) ���� : setBufferSize() ==> �⺻ 8KB, ���� ����
			- ���ΰ�ħ : clear(), flush() ==> �ڵ����� ó���ǰ� ���� : autoFlush=true
		
		4) application(****): ServeletContext
			- �������� : getRealPath()
			- �α����� : log()
			- web.xml ���� : getInitParameter()==> DB(url,username,password) Ȯ�� 
			
		5)pageContext (****) : ServeletContext
			- Ư�� ��ġ�� �ٸ� JSP������ ���� : include()
			- request�� ��� ���� : forward()	
			
		6) page : Object => this�� ���
		
		7) config : ServletConfig : ȯ�漳�� ==> web.xml ����
		
		8) session(****) : HttpSession  		
 --%>			
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>out Test</title>
</head>
<body>
	<%
		int size=out.getBufferSize(); // �� ���� ������
		int re=out.getRemaining(); //���� �ִ� ���� ������
	%>
	<div align="center">
		�� ���� ������: <%=size %><br/>
		���� �ִ� ���� : <%=re %><br/>
		��� ���� ���� : <%=size-re %>
	</div>
</body>
</html>
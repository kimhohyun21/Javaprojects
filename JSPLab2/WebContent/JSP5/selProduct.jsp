<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ����</title>
<%
		request.setCharacterEncoding("EUC-KR");	
			
		if(request.getParameter("name").length()==0){
			out.println("<script>alert('���̵� �Է����ּ���.')</script>");
			out.println("<script>history.go(-1)</script>");
		}

		session.setAttribute("name",request.getParameter("name")); 
		//�α׾ƿ��ϱ� ������ �������� �ٲ� name�� ������ ����
		
		String username=session.getAttribute("name").toString();		
		if(request.isRequestedSessionIdFromURL()){
			out.println("<script>alert('"+username.toString()+"���� �α��εǾ����ϴ�.')</script>");
		}
		
		ArrayList<String> list=new ArrayList<>();
		session.setAttribute("productList", list); //�Ӽ� ���� ����Ʈ�� ���뵵 ����		
	%>
</head>
<body>
	<div align="center">
		<h2>��ǰ����</h2>
		<%=username %>���� �α��εǾ����ϴ�.
		<hr />
		<form name="form2" method="post" action="add.jsp">
			<select name="product">
				<option>���</option>
				<option>��</option>
				<option>���ξ���</option>
				<option>�ڸ�</option>
				<option>����</option>
			</select> <input type="submit" value="����">
		</form>
		<a href="checkOut.jsp">���</a>
	</div>
</body>
</html>
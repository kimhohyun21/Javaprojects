<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Twitter Test</title>
	<%
		request.setCharacterEncoding("EUC-KR");
		String user=session.getAttribute("user").toString();
		String tweet=request.getParameter("cont").toString();
		
		Date d=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("MM�� dd��  E���� hh:mm");
		String date=sdf.format(d).toString();
		
		String content=(user+" :: "+tweet+" "+date);
		
		ArrayList<String> contentList=(ArrayList)application.getAttribute("contentList");
		
		if(contentList==null){			
			contentList=new ArrayList<>();
			application.setAttribute("contentList", contentList);
		}
		
		contentList.add(content);
		
		//��Ĺ �ܼ��� ���� �α� ����
		application.log(content+"�߰���");
		
		response.sendRedirect("twitter_list.jsp");
	%>
</head>
<body>
	
</body>
</html>
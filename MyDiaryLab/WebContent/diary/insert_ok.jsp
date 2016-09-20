<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.DiaryDAO"></jsp:useBean>
<jsp:useBean id="vo" class="com.sist.dao.DiaryVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	String id=(String)session.getAttribute("id");
	
	vo.setId(id);	
	
	dao.diaryInsert(vo);
	
	out.println("<script>alert('새 일정이 등록되었습니다.');</script>");
	out.println("<script>location.href='diary.jsp?year="+vo.getYear()+"&month="+vo.getMonth()+"';</script>");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String no=request.getParameter("no");	
	int num=Integer.parseInt(no);
	String pwd=request.getParameter("pwd");
	String curPage=request.getParameter("page");
	String fs=request.getParameter("fs");
	String ss=request.getParameter("ss");
	if(curPage==null)curPage="1";
	if(fs==null)fs="";
	if(ss==null)ss="";

	
	BoardDAO dao=new BoardDAO();
	BoardVO vo=new BoardVO();
	vo=dao.contentDetail(no, 2);
	System.out.println(no);	
	int depth=vo.getDepth();
	System.out.println(depth);	
	
	boolean bCheck=dao.delete(num, pwd);	
	
	if(bCheck==false){
		if(depth!=0){
			out.println("<script>alert('삭제할 수 없습니다. 관리자에게 문의해주세요.');</script>");
			out.println("<script>history.back();</script>");
		}else{
			out.println("<script>alert('비밀번호가 잘 못되었습니다.');</script>");
			out.println("<script>history.back();</script>");
		}	
	}else{
		out.println("<script>alert('삭제되었습니다.');</script>");
		out.println("<script>location.href='main.jsp?page="+curPage+"&fs="+fs+"&ss="+ss+"'</script>");	
	}

%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*, java.io.*"%>
<jsp:useBean id="dao" class="com.sist.dao.DataBoardDAO"></jsp:useBean>

<%
	request.setCharacterEncoding("EUC-KR");
	String curPage=request.getParameter("page");
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	//DataBoardDAO dao=new DataBoardDAO(); ==> jsp:useBean으로 대체
	DataBoardVO	vo=dao.fileInfoCheck(no); //==> 파일 크기, 이름 체크
	boolean bCheck=dao.delete(no, pwd); //==> 삭제 실시

	if(!bCheck){
		out.println("<script>alert('비밀번호가 잘 못 되었습니다.'); </script>");
		out.println("<script>history.back(); </script>");
	}else{
		// 파일도 함께 삭제
		if(vo.getFilesize()!=0){ //==> file.exists(); 라는 boolean메소드를 사용할 수도 있음
			File file=new File("c:\\download\\"+vo.getFilename());
			file.delete(); 
		}
		out.println("<script>alert('삭제 되었습니다.'); </script>");
		out.println("<script>location.href='list.jsp?page="+curPage+"'; </script>");
	}
	
%>
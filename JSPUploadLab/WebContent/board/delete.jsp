<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*, java.io.*"%>
<jsp:useBean id="dao" class="com.sist.dao.DataBoardDAO"></jsp:useBean>

<%
	request.setCharacterEncoding("EUC-KR");
	String curPage=request.getParameter("page");
	String no=request.getParameter("no");
	String pwd=request.getParameter("pwd");
	
	//DataBoardDAO dao=new DataBoardDAO(); ==> jsp:useBean���� ��ü
	DataBoardVO	vo=dao.fileInfoCheck(no); //==> ���� ũ��, �̸� üũ
	boolean bCheck=dao.delete(no, pwd); //==> ���� �ǽ�

	if(!bCheck){
		out.println("<script>alert('��й�ȣ�� �� �� �Ǿ����ϴ�.'); </script>");
		out.println("<script>history.back(); </script>");
	}else{
		// ���ϵ� �Բ� ����
		if(vo.getFilesize()!=0){ //==> file.exists(); ��� boolean�޼ҵ带 ����� ���� ����
			File file=new File("c:\\download\\"+vo.getFilename());
			file.delete(); 
		}
		out.println("<script>alert('���� �Ǿ����ϴ�.'); </script>");
		out.println("<script>location.href='list.jsp?page="+curPage+"'; </script>");
	}
	
%>
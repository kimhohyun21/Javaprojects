<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*, com.sist.dao.*"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<jsp:useBean id="dao" class="com.sist.dao.DataBoardDAO"></jsp:useBean>
<%
	//���� ���ε� ����
	String path="C:\\download";
	int size=1024*1024*100;
	String enctype="EUC-KR";
	MultipartRequest mr=new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());
	
	String curPage=mr.getParameter("page");
	String no=mr.getParameter("no");
	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String filename=mr.getOriginalFileName("file");
	String pwd=mr.getParameter("pwd");
	
	//DataBoardDAO dao=new DataBoardDAO(); ==> <jsp:useBean>���� ��ü
	
	//���� ���� ���� �̸��� �뷮 �ҷ�����
	DataBoardVO dbvo=dao.contentDetail(no, 2);
	String db_filename=dbvo.getFilename();
	int db_filesize=dbvo.getFilesize();
	
	DataBoardVO vo=new DataBoardVO();
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	
	if(filename==null){
		vo.setFilename(db_filename);
		vo.setFilesize(db_filesize);
	}else{
		File dfile=new File(path+"\\"+db_filename);
		dfile.delete();
		vo.setFilename(filename);
		File file=new File(path+"\\"+filename);
		vo.setFilesize((int)file.length());		
	}
	
	vo.setPwd(pwd);
	
	//�н����� üũ �� �������� ������Ʈ
	boolean bCheck=dao.update(vo);
	
	if(bCheck==false){
		out.println("<script>alert('�н����尡 �� ���Ǿ����ϴ�.'); </script>");
		out.println("<script>history.back();</script>");
	}else{
		out.println("<script>alert('���� �Ǿ����ϴ�.'); </script>");
		out.println("<script>location.href='list.jsp?page="+curPage+"';</script>");
	}

%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*, java.io.*"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%
	//���� ���ε� ����
	String path="c:\\download";
	int size=1024*1024*100;
	String enctype="EUC-KR";
	MultipartRequest mr=new MultipartRequest(request, path, size, enctype, new DefaultFileRenamePolicy());

	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String filename=mr.getOriginalFileName("file");
	String pwd=mr.getParameter("pwd");
	
	DataBoardDAO dao=new DataBoardDAO();
	DataBoardVO vo=new DataBoardVO();  
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	
	if(filename==null){
		vo.setFilename("");
		vo.setFilesize(0);
	}else{
		vo.setFilename(filename);
		File file=new File(path+"\\"+filename);
		vo.setFilesize((int)file.length());
	}
	
	vo.setPwd(pwd);
	
	//����ϱ�
	dao.insert(vo);
	
	//������ �̵�
	out.println("<script>alert('�� �����Ͱ� ��ϵǾ����ϴ�.');</script>");
	out.println("<script>location.href='list.jsp';</script>");
%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*, java.io.*"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%
	//파일 업로드 설정
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
	
	//등록하기
	dao.insert(vo);
	
	//페이지 이동
	out.println("<script>alert('새 데이터가 등록되었습니다.');</script>");
	out.println("<script>location.href='list.jsp';</script>");
%>
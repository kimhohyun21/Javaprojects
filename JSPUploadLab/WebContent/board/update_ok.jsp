<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*, com.sist.dao.*"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%
	//파일 업로드 설정
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
	
	DataBoardDAO dao=new DataBoardDAO();
	DataBoardVO vo=dao.contentDetail(no, 2);
	String db_filename=vo.getFilename();
	int db_filesize=vo.getFilesize();
	
	vo=new DataBoardVO();
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	
	if(filename==null){
		vo.setFilename(db_filename);
		vo.setFilesize(db_filesize);
	}else{
		vo.setFilename(filename);
		File file=new File(path+"\\"+filename);
		vo.setFilesize((int)file.length());		
	}
	
	vo.setPwd(pwd);
	
	//패스워드 체크 및 수정내용 업데이트
	boolean bCheck=dao.update(vo);
	
	if(bCheck==false){
		out.println("<script>alert('패스워드가 잘 못되었습니다.'); </script>");
		out.println("<script>history.back();</script>");
	}else{
		out.println("<script>alert('수정 되었습니다.'); </script>");
		out.println("<script>location.href='list.jsp?page="+curPage+"';</script>");
	}

%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.net.*, java.io.*"%>
<%--  
	#JSP ����
		# ��ũ��Ʈ �±�
			1) ������ �±�(Directive Tag)
				: �����̳ʰ� JSP�� servlet���� ��ȯ�� ��, Ư�� ���ø� ������ ���� ����ϴ� �±�
					- page : �������� ���, Ư¡ ����
						= import : �Ӽ��� �� �����ϰ� �� ���������� ���� �� �� �� ����
						= contentType : JSP�� �����ϴ� ����(Response)�� MINE TYPE�� ����
						= session : ���� ��ü�� �������θ� ���� (true or false). true�� default��
						= errorPage : JSP �������� �����ҵ� �� ����(Exception)�� �߻��ϸ� ���࿡ �ű� page�� �����
										Ex) <@ page errorPage="/error.jsp" %>
						= pageEncoding : response stream�� ���ڼ�(character set)�� ������
						= �׿� : language, info, buffer, autoFlush....
						
					- include : JSP�������� �ٸ� �������� ���Խ�Ű�� ���� ����
					
					- taglib : custom tag ���� ���õ� ����
					
				����)
					<%@ ���þ�  �Ӽ�="��" �Ӽ�="��".....%>
				
			2) ǥ���� �±�(Expression Tag)
				: Response Stream�� ���� ����� �ϱ� ���� �±�
				����) 
					<%=��³��� %>
			3) ���� �±�(Declaration Tag)
			4) ��ũ��Ʈ �±�(Script Tag)
				: Ŭ���̾�Ʈ�� ��û(request)�� ���� ���� �����ϴ� �ڵ�
				  _jspService()�� �����η� ���ԵǴ� Java�ڵ带  �ۼ��ϴ� �κ�
				����) 
					<% Java Code %>
			5) �ּ�
				- HTML �ּ� : <!-- ���� -->
				- JSP �ּ� : <%-- ����  -%>
				- Java �ּ� : //, /* */
		
		#���尴ü 
			1) ����
				- JSP������ �⺻������ �����ϴ� ��ü
				- �����̳� ���� �ڵ� ���� �ٷ� ����� �� �ִ� ��ü
				- JSP�� Servlet���� ��ȯ�� �� container�� �ۼ�
					= request : HttpServletRequest
					= reponse : HttpServeletResponse
					= out : JspWriter (Servlet���� PrintWriter�� ���� ����)
					= session : HttpSession
					= application : ServletContext
					= Config : ServletConfig
					= pageContext 
					= page : this. Servlet ��ü �ڽ�
					= exception : Throwable
					
			    Web Container	
			JSP ==============> Servlet (Service()): Java Source ===> Class File(.java)
 --%>
<%
	request.setCharacterEncoding("EUC-KR");
	String fn=request.getParameter("fn");
	response.setHeader("content-Disposition", "attachment;filename="+URLEncoder.encode(fn, "UTF-8"));
	
	//�ٿ�ε� : ���� ===> Ŭ���̾�Ʈ�� ������ ����
	try{
		File file=new File("c:\\download\\"+fn);
		
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));	
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
		
		byte[] buffer=new byte[1024];
		int i=0;
		while((i=bis.read(buffer,0,1024))!=-1){ //read(o, n, m) ==> �Ķ���Ͱ� 3�� �϶�, o=�о� �� ��ü, n=����ũ��, m=�ִ� ũ��
			bos.write(buffer, 0, i);
		}
		/*
			out: jsp = servlet���� ��ȯ�� ��, ���������� out ��ü�� ����
			������ out�� �ϴ� �ʱ�ȭ �ؾ� ������ ����
		*/
		out.clear();
		out=pageContext.pushBody();
		bis.close();
		bos.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%> 
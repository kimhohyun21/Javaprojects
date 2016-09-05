<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
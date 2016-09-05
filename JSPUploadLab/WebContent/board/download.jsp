<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  
	#JSP 정리
		# 스크립트 태그
			1) 지시자 태그(Directive Tag)
				: 컨테이너가 JSP를 servlet으로 변환할 때, 특정 지시를 내리기 위해 사용하는 태그
					- page : 페이지의 기능, 특징 지시
						= import : 속성들 중 유일하게 한 페이지에서 여러 번 올 수 있음
						= contentType : JSP가 생성하는 응답(Response)의 MINE TYPE을 지정
						= session : 내장 객체의 생성여부를 결정 (true or false). true가 default값
						= errorPage : JSP 페이지가 실행할될 때 오류(Exception)가 발생하면 수행에 옮길 page를 기술함
										Ex) <@ page errorPage="/error.jsp" %>
						= pageEncoding : response stream의 문자셋(character set)을 지정함
						= 그외 : language, info, buffer, autoFlush....
						
					- include : JSP페이지에 다른 페이지를 포함시키는 것을 지시
					
					- taglib : custom tag 사용과 관련되 지시
					
				형식)
					<%@ 지시어  속성="값" 속성="값".....%>
				
			2) 표현식 태그(Expression Tag)
				: Response Stream을 통해 출력을 하기 위한 태그
				형식) 
					<%=출력내용 %>
			3) 선언 태그(Declaration Tag)
			4) 스크립트 태그(Script Tag)
				: 클라이언트의 요청(request)에 대한 동적 서비스하는 코드
				  _jspService()의 구현부로 삽입되는 Java코드를  작성하는 부분
				형식) 
					<% Java Code %>
			5) 주석
				- HTML 주석 : <!-- 내용 -->
				- JSP 주석 : <%-- 내용  -%>
				- Java 주석 : //, /* */
		
		#내장객체 
			1) 정의
				- JSP내에서 기본적으로 제공하는 객체
				- 생성이나 참조 코드 없이 바로 사용할 수 있는 객체
				- JSP가 Servlet으로 변환될 때 container가 작성
					= request : HttpServletRequest
					= reponse : HttpServeletResponse
					= out : JspWriter (Servlet에서 PrintWriter와 같은 역할)
					= session : HttpSession
					= application : ServletContext
					= Config : ServletConfig
					= pageContext 
					= page : this. Servlet 객체 자신
					= exception : Throwable
					
			    Web Container	
			JSP ==============> Servlet (Service()): Java Source ===> Class File(.java)
 --%>
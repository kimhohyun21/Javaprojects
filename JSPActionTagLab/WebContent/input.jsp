<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인 정보 입력</title>
<%--   
	#JSP 액션 태그(Action Tag)
		1) 정의
		 	- JSP 내에서 자바코드를 줄이기 위한 방법으로 제안된 태그
			- 액션태그는 JSP 내에서 Java코드 없이 특정 업무를 처리하기 위한 태그
		
		2) 종류
			- 표준액션 태그: JSP Spec에서 제공하는 표준 액션 태그
			- Custom Tag: 사용자 정의 액션 태그
		
		3) 문법
			- 형식) <prefix:태그명 속성="value" [...]/>
			- 태그는 대소문자를 구분함
			- 속성의 값은 "또는 '로 감싸줌
			- 태그는 반드시 닫아야함
				Ex) for each문 대체 태그
					<c:forEach item='list' var='mvo'></c:forEach>
				   
					getter, setter를 활용하기 위한 태그
				  	<jsp:getPropoty name='cvo' property='name'/>

		4) Property란?
			- 객체
				= 값 표현 : VO, DTO -> instance variable이 중요
				= 동작(기능) 수행 : DAO
			- Ex)
				class StudentVO{
					private String name; 
					//private으로 설정되어 있으면 기본적으로 다른 객체와 연관이 없는 것으로 간주
					//대신 GET과 SET메소드를 제공하여 다른 객체와 연관성을 가지고 활용할 수 있게 함
					
					public void SetName(String name); ==> property라고 함
					String getName()				  ==> property라고 함	
				}	
		
		5) Bean과 연동하기 위한 액션태그
			- <jsp:setProperty> : java bean에 값을 setting하는 태그 
				==> bean은 확장된 개념의 class라고 볼 수 있음
				==> 특정 값을 명시적으로 할당할 수 있고, form tag를 넘어온 Data를 이 태그를 해용해 넣을 수 있음
			- <jsp:getProperty> :프로퍼티 값을 얻어낼 때 사용
			- <jsp:include> :  다른 페이지의 실행 결과를 현재 페이지로 포함시킬 때 사용
			- <jsp:forword> : 페이지 사이의 제어를 이동 시킬 때 사용
			- <jsp:useBean> : 자바빈을 JSP페이지에서 사용할 때 사용
 --%>
</head>
<body>
	<div align="center">
		<h3>개인정보입력</h3>
		<form method="post" action="output1.jsp">
			<table border="1" width="350">
				<tr>
					<td width="20%" align="center">
						ID
					</td>
					<td>
						<input type="text" name="id" size="12">
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						이름
					</td>
					<td>
						<input type="text" name="name" size="12">
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						성별
					</td>
					<td>
						<input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						주소
					</td>
					<td>
						<input type="text" name="addr" size="30">
					</td>
				</tr>
				<tr>
					<td width="20%" align="center">
						전화
					</td>
					<td>
						<input type="text" name="tel" size="20">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="전송">
					</td>
				</tr>				
			</table>
		</form>
	</div>
</body>
</html>
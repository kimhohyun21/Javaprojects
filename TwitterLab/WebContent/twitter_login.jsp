<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@프로젝트 명 : TwitterLab
		1)오후 실습 
			- JSP내장 객체 이용
			- 데이터 베이스를 사용하지 않고 application 객체를 이용해서
			    공용 저장소로 활용한다
			- 톰켓이 종료되면 저장된 데이터도 초기화 된다
			- 다중 사용자 접속이 지원되고 개별 사용자 id를 유지한다		
		
		2) 구성 프로그램 파일명
			- twitter_login.jsp 
				= 로그인 화면
			   	= 비밀번호 X, 사용자 이름만 입력하는 양식 구현
			- twitter_list.jsp 
			   	= 트위터 메인 화면
			   	= 글 등록할 수 있는 창 구현
			   	= 등록된 글의 목록이 나타남, 작성자 아이디와 내용 시간이 출력되도록 구현
		    - tweet.jsp		    
		    	= 현재 로그인한 사용자 아이디, 작성메세지를 저장
		    	= application 내장 객체를 이용해서 모든 사용자가 사용할 수 있는 임시 저장소로 활용
		    			
 --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Twitter Test</title>
</head>
<body>
	<div align="center">
		<h2>Twitter Login</h2>
		<form action="twitter_list.jsp" method="post" name="frm">
			<input type="text" name="id" size="15">
			<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>
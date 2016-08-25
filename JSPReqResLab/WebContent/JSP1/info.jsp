<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@form에서 사용할 수 있는 속성
		1) text => name
		2) radio => 성별
		3) select => 지역
		4) checkbox => 취미
		5) textarea => 소개
		
	@전송 방식
		1) GET방식 (URL): output.jsp?name=aaa&hobby=bbb
			- GET 방식으로 전송할 경우 url 뒤에 쿼리 문자열이 생성됨
			- 주소 창을 타고 데이터가 넘어가기 때문에 보안이 되지 않음
			- 최대 255자 이하의 소용량 데이터를 전송함
			- GET 방식으로 요청을 하면 doGet메서드가 자동으로 호출됨
			
		2) POST방식 (내부네트워크) : name=aaa&hobby=bbb
		                       ==> 자동으로 request.addAttribute("name", 값)방식으로 전송
		                       ==> 사용자가 request.getParameter("name")으로  값을 가져올 수 있음
	   		- html header를 타고 데이터가 전송이 되기 때문에 보안이 가능
	   		- 255자 이상의 대용량 데이터를 전송함
	   		- 데이터 영역을 이용하여 전송을 하기 때문에 파라미터 길이에 제한이 없음
	   		- POST방식으로 요청을 하면 doPost 데이터를 전송함	   		
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>개인 정보 입력</title>
</head>
<body>
	<div align="center">
		<h3>개인 정보</h3>
		<form action="output.jsp" method="post">
			<table border="1" width="400">
				<tr>
					<td width="20%">이름</td>
					<td>
						<input type="text" name="name" size="10">
					</td>
				</tr>
				<tr>
					<td width="20%">성별</td>
					<td>
						<input type="radio" name="gender" value="남자" checked>남자
						<input type="radio" name="gender" value="여자">여자
					</td>
				</tr>
				<tr>
					<td width="20%">지역</td>
					<td>
						<select name="loc">
							<option>서울</option>
							<option>경기</option>
							<option>인천</option>
							<option>대전</option>
							<option>부산</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="20%">취미</td>
					<td>
						<input type="checkbox" name="hobby" value="운동">운동
						<input type="checkbox" name="hobby" value="노래">노래
						<input type="checkbox" name="hobby" value="낚시">낚시
						<input type="checkbox" name="hobby" value="등산">등산
						<input type="checkbox" name="hobby" value="독서">독서
					</td>
				</tr>
				<tr>
					<td width="20%">자기소개</td>
					<td>
						<textarea rows="5" cols="35" name="content"></textarea>
					</td>
				</tr>														
			</table>
			<table border="0" width="400">
				<tr>
					<td align="center">
						<input type="submit" value="전송">
						<input type="reset" value="취소">
					</td>
				</tr>	
			</table>
		</form>	
	</div>
</body>
</html>
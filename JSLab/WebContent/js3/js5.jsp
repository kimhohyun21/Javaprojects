<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<!-- 
	@함수와 명시적인 이름을 가진 인자 전달
	
 -->
<body>
	<script type="text/javascript">
		function power(arg){ //제곱을 반환하는 함수
			if(!arg.base){
				arg.base=1;
			}
			
			if(!arg.exponent){
				arg.exponent=0;
			}
			
			//내장객체 Math의 pow함수 호출해 결과 리턴
			return Math.pow(arg.base, arg.exponent);
		};
		
		document.writeln('power({base:3, exponent:2})의 결과 값: '+power({base:3, exponent:2})+'<br/>');
		document.writeln('power({base:3})의 결과 값: '+power({base:3})+'<br/>');
		document.writeln('power({exponent:2})의 결과 값: '+power({exponent:2})+'<br/>');
		
	</script>
</body>
</html>
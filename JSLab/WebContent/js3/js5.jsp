<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<!-- 
	@�Լ��� ������� �̸��� ���� ���� ����
	
 -->
<body>
	<script type="text/javascript">
		function power(arg){ //������ ��ȯ�ϴ� �Լ�
			if(!arg.base){
				arg.base=1;
			}
			
			if(!arg.exponent){
				arg.exponent=0;
			}
			
			//���尴ü Math�� pow�Լ� ȣ���� ��� ����
			return Math.pow(arg.base, arg.exponent);
		};
		
		document.writeln('power({base:3, exponent:2})�� ��� ��: '+power({base:3, exponent:2})+'<br/>');
		document.writeln('power({base:3})�� ��� ��: '+power({base:3})+'<br/>');
		document.writeln('power({exponent:2})�� ��� ��: '+power({exponent:2})+'<br/>');
		
	</script>
</body>
</html>
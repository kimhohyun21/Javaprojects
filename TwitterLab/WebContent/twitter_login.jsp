<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
	@������Ʈ �� : TwitterLab
		1)���� �ǽ� 
			- JSP���� ��ü �̿�
			- ������ ���̽��� ������� �ʰ� application ��ü�� �̿��ؼ�
			    ���� ����ҷ� Ȱ���Ѵ�
			- ������ ����Ǹ� ����� �����͵� �ʱ�ȭ �ȴ�
			- ���� ����� ������ �����ǰ� ���� ����� id�� �����Ѵ�		
		
		2) ���� ���α׷� ���ϸ�
			- twitter_login.jsp 
				= �α��� ȭ��
			   	= ��й�ȣ X, ����� �̸��� �Է��ϴ� ��� ����
			- twitter_list.jsp 
			   	= Ʈ���� ���� ȭ��
			   	= �� ����� �� �ִ� â ����
			   	= ��ϵ� ���� ����� ��Ÿ��, �ۼ��� ���̵�� ���� �ð��� ��µǵ��� ����
		    - tweet.jsp		    
		    	= ���� �α����� ����� ���̵�, �ۼ��޼����� ����
		    	= application ���� ��ü�� �̿��ؼ� ��� ����ڰ� ����� �� �ִ� �ӽ� ����ҷ� Ȱ��
		    			
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
			<input type="submit" value="�α���">
		</form>
	</div>
</body>
</html>
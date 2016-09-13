<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>database</title>
	<%--
		#JDBC ���α׷��� �ܰ�
			1) DB ���� : server IP, userID, userPassword, SID(DB)
			2) ���� ����
			3) (DB ����) ������
			4) ��� ���� (=> ������(��Ĺ))=> Ŭ���̾�Ʈ
			
		#JDBC ����, ����
			1) �ڹپ��ø����̼ǿ��� ǥ��ȭ�� DB ���� ����
			2) �� DB ���ӿ� ���� ���� ������ �� �ʿ� ����
			3) �̷������δ� ���ߵ� ���ø����̼ǿ��� DB ����� JDBC ����̹��� ��ü�ϸ� ��
		
		#JDBC ����
			���ø����̼�----JDBC���� ������----����Ŭ JDBC ����̹�(ojdbc6.jar)	===loading==>����Ŭ DBMS
							 		  |-----------MySql JDBC ����̹�===loading==>MySql DBMS
											                           		   ......
		
		#JDBC ���α׷��ִܰ�
			1) JDBC ����̹� �ε� : Class.forName();
			2) DB ���� : java.sql.Connection();
			3) Statement���� : java.sql.Statement, PrepareStatement();
			4) SQL�� ���� : excuteQuery();, excuteUpdate();
			5) ��� �ޱ� : java.sql.ResultSet
				Ex)
					==> SELECT * FROM xxx WHERE xxx 
					==> DB �˻� ��� 00��
					 name		 email		 city
					------------------------------
					 000		 0000		 0000
					 000		 0000		 0000
					 000		 0000		 0000
					==> ResultSet�� ���
					==> rs.next() ���� ������ �� �ֵ��� ����
					==> rs.getXxx() ���� ������
					==> rs.close() ���� ���� result�� ���� ��Ŵ
					
			6) ���� �����ϱ� : java.sql.Connection ==> close();
			
		#Ŀ�ؼ�
			1) ���ø����̼ǰ� DB�� ����
			2) ���ø����̼ǿ��� DB�� �����ϰ� ������ �����ϴ� �Ϸ��� ����
				=> ���� ���� ����ڰ� �þ�� �ý��ۿ� ���� ���ϸ� ��
				=> ���̼��� ��å : ��ȿ���� Ŀ�ؼ� ������  ����� �ս� �߻�
				=> ��Ը� �ý����ϼ���  Ŀ�ؼ� ������ ���߿��� �߿��� ��ġ�� ������	
			
		#Ŀ�ؼ� Ǯ(Connection Pool)
			1) ����
				- ���ø����̼ǿ��� �ʿ�� �ϴ� �������� Ŀ�ؼ��� ����� ���� �ƴϰ�
				    �̸� ������ ���� Ŀ�ؼ��� ����� ���� �ʿ��� ������ ���������̼ǿ� �����ϴ� ����, ����ü��
			
			2) Ŀ�ؼ� Ǯ�� ������� �ʴ� ����
									 (JDBC)				
				Ŭ���̾�Ʈ-------����/����---------------->�����ͺ��̽�
					^									|
					|									|
					----------���� ���---------------------  	
			3) Ŀ�ؼ� Ǯ�� ����ϴ� ����
									 Ŀ�ؼ� Ǯ API(JDBC)				
				Ŭ���̾�Ʈ-------����/����---------------->�����ͺ��̽�
					^									|
					|					Ŀ�ؼ� Ǯ			|
					----------���� ���--------------------  								                           		    
	 									- ���� ���� ����
	 									- �⺻ ���� Ȯ��
	 
	 			=> �� ���ø����̼� ������ ���۵� �� ���� ���� Ŀ�ؼ��� �̸� ������
	 			=> �� ���������̼� ��û�� ���� ����� Ŀ�ؼ� ��ü�� ������(JNDI ���)
	 			=> ���� �� �̻��� Ŀ�ؼ��� ���Ǹ� ���ο� Ŀ�ؼ��� ����
	 			=> ������� �ʴ� Ŀ�ؼ��� �����ϰ� �ּ����� �⺻ Ŀ�ؼ��� ������
	 			
	 		4) DBCP(DataBase Connection Pool) API�� ���� Ŀ�ؼ� Ǯ ����
	 			- DBCP API : ��Ĺ 7.0���ʹ� ��ü ����, �����Ͽ� ��� ����
	 			- ��Ĺ�� DataSource �����ϱ�
	 				=> ��Ĺ���� �������� ������ server.xml���� ����
	 				=> server.xml : DB������ ���� ����, Ŀ�ؼ� Ǯ � ���� ������ ������
	 --%>
</head>
<body>
	<div align="center">
		database
	</div>
</body>
</html>
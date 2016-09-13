<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>database</title>
	<%--
		#JDBC 프로그래밍 단계
			1) DB 연결 : server IP, userID, userPassword, SID(DB)
			2) 쿼리 전달
			3) (DB 서버) 리스너
			4) 결과 전달 (=> 웹서버(톰캣))=> 클라이언트
			
		#JDBC 개념, 역할
			1) 자바어플리케이션에서 표준화된 DB 접근 제공
			2) 각 DB 접속에 대한 상세한 정보를 알 필요 없음
			3) 이론적으로는 개발된 애플리케이션에서 DB 변경시 JDBC 드라이버만 교체하면 됨
		
		#JDBC 구조
			어플리케이션----JDBC드라업 관리자----오라클 JDBC 드라이버(ojdbc6.jar)	===loading==>오라클 DBMS
							 		  |-----------MySql JDBC 드라이버===loading==>MySql DBMS
											                           		   ......
		
		#JDBC 프로그래밍단계
			1) JDBC 드라이버 로드 : Class.forName();
			2) DB 연결 : java.sql.Connection();
			3) Statement생성 : java.sql.Statement, PrepareStatement();
			4) SQL문 전송 : excuteQuery();, excuteUpdate();
			5) 결과 받기 : java.sql.ResultSet
				Ex)
					==> SELECT * FROM xxx WHERE xxx 
					==> DB 검색 결과 00건
					 name		 email		 city
					------------------------------
					 000		 0000		 0000
					 000		 0000		 0000
					 000		 0000		 0000
					==> ResultSet에 담김
					==> rs.next() 값을 가져올 수 있도록 설정
					==> rs.getXxx() 값을 가져옴
					==> rs.close() 값을 담은 result를 종료 시킴
					
			6) 연결 해제하기 : java.sql.Connection ==> close();
			
		#커넥션
			1) 어플리케이션과 DB의 연결
			2) 애플리케이션에서 DB에 접속하고 접속을 종료하는 일련의 과정
				=> 동시 접속 사용자가 늘어나면 시스템에 많은 부하를 줌
				=> 라이센스 정책 : 비효율적 커넥션 관리는  비용적 손실 발생
				=> 대규모 시스템일수록  커넥션 관리는 개발에서 중요한 위치를 차지함	
			
		#커넥션 풀(Connection Pool)
			1) 개념
				- 어플리케이션에서 필요로 하는 시점에서 커넥션을 만드는 것이 아니고
				    미리 일정한 수의 커넥션을 만들어 놓고 필요한 시점에 어플이케이션에 제공하는 서비스, 관리체계
			
			2) 커넥션 풀을 사용하지 않는 구조
									 (JDBC)				
				클라이언트-------연결/쿼리---------------->데이터베이스
					^									|
					|									|
					----------실행 결과---------------------  	
			3) 커넥션 풀을 사용하는 구조
									 커넥션 풀 API(JDBC)				
				클라이언트-------연결/쿼리---------------->데이터베이스
					^									|
					|					커넥션 풀			|
					----------실행 결과--------------------  								                           		    
	 									- 유휴 연결 관리
	 									- 기본 연결 확보
	 
	 			=> 웹 어플리케이션 서버가 시작될 때 일정 수의 커넥션을 미리 생성함
	 			=> 웹 어플이케이션 요청에 따라 생산된 커넥션 객체를 전달함(JNDI 사용)
	 			=> 일정 수 이상의 커넥션이 사용되면 새로운 커넥션을 만듦
	 			=> 사용하지 않는 커넥션은 종료하고 최소한의 기본 커넥션을 유지함
	 			
	 		4) DBCP(DataBase Connection Pool) API를 통한 커넥션 풀 구현
	 			- DBCP API : 톰캣 7.0부터는 자체 내장, 설정하여 사용 가능
	 			- 톰캣에 DataSource 설정하기
	 				=> 톰캣에서 서버설정 파일인 server.xml에서 설정
	 				=> server.xml : DB연결을 위한 정보, 커넥션 풀 운영 관련 정보로 구성됨
	 --%>
</head>
<body>
	<div align="center">
		database
	</div>
</body>
</html>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, java.text.*, com.sist.dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="dao" class="com.sist.dao.DiaryDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	Object name=session.getAttribute("name");
	if(name==null){
		out.write("<script>alert('세션이 종료되었습니다.');</script>");
		out.write("<script>location.href='login.jsp';</script>");
	};
	String id=String.valueOf(session.getAttribute("id"));	
	
	//날짜를 달력에 활용하기 위해  SimpleDateFormat으로 받아서 String 값으로 작성
	Date date=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
	String today=sdf.format(date);
	StringTokenizer st=new StringTokenizer(today,"-");
	String sYear=st.nextToken();
	String sMonth=st.nextToken();
	String sDay=st.nextToken();
	
	//요일 및 날짜 표기를 위한 배열
	String[] strWeek={"일", "월", "화", "수", "목", "금", "토"};
	int[] lastDay={31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	//년, 월 정의
	String strYear=request.getParameter("year");
	if(strYear==null){ strYear=sYear; };
	String strMonth=request.getParameter("month");
	if(strMonth==null){ strMonth=sMonth; };
	
	int year=Integer.parseInt(strYear);
	int month=Integer.parseInt(strMonth);
	int day=Integer.parseInt(sDay);
	
	//윤년 처리
	//전년까지 합
	int total=(year-1)*365+(year-1)/4-(year-1)/100+(year-1)/400;
	
	//2월 일수 계산
	if((year%4==0 && year%100!=0)||(year%400==0)){
		lastDay[1]=29;
	}else{
		lastDay[1]=28;
	}
	
	//전월까지일수 계산
	for(int i=0;i<month-1;i++){
		total+=lastDay[i]; 
	}
	total++;
	
	//주수 계산
	int week=total%7;
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>diary</title>
	<link rel="stylesheet" type="text/css" href="table.css">
	<script type="text/javascript" src="jquery-3.1.0.js"></script>
	<script type="text/javascript">
		function change(){
			document.frm.submit();
		}
	</script>
</head>
<body>
	<div align="center">
		<form  action="diary.jsp" method="post" id="diary_frm" name="frm">
			<table id="title_table">
			<caption id="title_cap"><%=year %>월 <%=month %>월 <%=name %>님의 일정</caption>
				<tr>
					<td> <!-- 연도 선택하는 옵션 -->
						<select name="year" onchange="change()">
						<%
							for(int i=2016;i<=2030;i++){
								if(i==year){
						%>
							<option selected><%=i %></option>	
						<%			
								}else{
						%>
							<option><%=i %></option>
						<%			
								}
							}
						%>
						</select>년도&nbsp;&nbsp;
						<select name="month" onchange="change()">
						<%
							for(int i=1;i<=12;i++){
								if(i==month){
									
						%>
							<option selected><%=i %></option>
						<%
								}else{							
						%>
							<option><%=i %></option>
						<%
								}
							}
						%>	
						</select>월
					</td>
				</tr>	
			</table>
			<table id="diary_table">
				<tr>
		<%
			String cls="none";
			int i=0;
			for(String s:strWeek){
				if(i==0)cls="sun";
				else if(i==6)cls="sat";
				else cls="none";
		%>
					<th id="<%=cls %>"><%=s %></th>
		<% 
				i++;
			}
		%>
				</tr>
		<%	
			for(i=1;i<=lastDay[month-1];i++){
				if(i==1){
		%>					
				<tr>
		<%	
					for(int j=0;j<week;j++){
		%>					
					<td class="day_td">&nbsp;</td>
		<%
					}
				}		
				
				if(i==day)cls="theday_td";
				else cls="day_td";
		%>		
					<td class="<%=cls%>">
						<a href="insert.jsp?year=<%=year %>&month=<%=month %>&day=<%=i %>"><%=i %></a>
		<%
				int count=dao.isDate(id, year, month, day);
				String title="일정이"+count+"개 있습니다.";
				if(count!=0){
		%>	
					<center>
						<img src="img/diary_alarm.png" width="30" height="30" title="<%=title %>">
					</center>
		<%
				}
		%>
					</td>
		<%	
				if(i==lastDay[month-1] && week<6){
					for(;week<6;week++){
		%>					
					<td class="day_td">&nbsp;</td>
		<%
					}
				}else{
					week++;
					if(week>6){	
					week=0; 
		%>			
				</tr>	
		<%
					}
				}
			}		
		%>				
			</table>
		</form>
	</div>
</body>
</html>
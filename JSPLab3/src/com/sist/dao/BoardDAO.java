package com.sist.dao;

import java.util.*;
import java.sql.*;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private final String URL="jdbc:oracle:thin:@localhost:1521:ORCL";
	private final String USER="scott";
	private final String PWD="tiger";
	
	//드라이버 등록
	public BoardDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//오라클 연결 해제
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//오라클 연결
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, USER, PWD);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/* 기능
	 * 
	 * <답변형 게시판 제작에 필요한 변수>
	 * 	- group_id(gi)   : 게시물과 답변을 구분해주는 변수
	 * 	- group_step(gs) : 게시물의 답변과 답변에 대한 답변을 구분하기 위해 사용하는 변수
	 * 	- group_tab(gt)  : 위치를 표기하는 변수
	 * 
	 * 					
	 * 						gi		gs		gt
	 * AAAAAAA				2		0		0						
	 * 	=>KKKKKKK			2		1		1
	 * 	=>DDDDDDD			2		1		1
	 * 		=>OOOOOOO		2		2		2
	 * 		=>CCCCCCC		2		2		2
	 * 
	 * BBBBBBB				1		0		0
	 * 	=>EEEEEEE			1		1		1
	 * 
	 * <게시판의 전체적인 프로그램 구조>
	 * 	1. 게시물 목록 조회
	 * 	2. 게시물 입력 폼    C(create)
	 * 	3. 게시물 답변	  R(reply)	
	 *	4. 게시물 수정	  U(update)	
	 *	5. 게시물 삭제	  D(delete)
	 */
	
	/*
	 * <게시판 목록 조회(list.jsp)>
	 *	- 게시판 목록 조회는 게시판이 실행이 되는 초기프로그램.
	 *	- 게시판 목록을 조회할 때, 페이당 출력 목록을 제한하는 페이지 네비게이션을 사용함
	 *		=> 변수 지정, 초기값 부여
	 */
	public List<BoardVO> boardListData(int page){
		List<BoardVO> list=new ArrayList<>();
			try{
				getConnection();
				
				String sql="SELECT no, subject, name, regDate, hit, group_tab "
							+ "FROM replyBoard "
							+ "ORDER BY group_id DESC, group_step ASC";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				
				int i=0;
				int j=0;
				int pagecnt=(page*10)-10;
				/*
				 * 	13 => 0~9, 10~12
				 * 
				 * 	1page	2page	3page
				 * 	0		10		20
				 * 	9		19		29
				 */
				
				while(rs.next()){
					if(i<10 && j>=pagecnt){
						BoardVO vo=new BoardVO();
						vo.setNo(rs.getInt(1));
						vo.setSubject(rs.getString(2));
						vo.setName(rs.getString(3));
						vo.setRegDate(rs.getDate(4));
						vo.setHit(rs.getInt(5));
						vo.setGroup_tab(rs.getInt(6));
						list.add(vo);
						i++;
					}
					j++;
				}
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				disConnection();
			}
		return list;
	}
	
	//전체 페이지 개수 구하는 메서드
	public int boardTotalPage(){
		int total=0;
		try{
			getConnection();
			
			String sql="SELECT CEIL(COUNT(*)/10) " //전체 게시글의 수를 체크하여 10으로 나누어 주고 올림을 하면 페이지 수
						+ "FROM replyBoard"; 
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);

			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	//전체 레코드수를 구하는 메서드
	public int boardRowCount(){
		int total=0;
		try{
			getConnection();
			
			String sql="SELECT COUNT(*) FROM replyBoard";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);

			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return total;
	}
	
	/*
	 * <게시글 추가하는 기능>
	 * INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
     *  VALUES(rb_no_sec.nextval,'오해영','','답변형 게시판', '답변형 게시판 만들기', '1234',15); 
	 * 
	 */	
	public void boardInsert(BoardVO vo){
		try{
			getConnection();
			
			String sql="INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id) "
						+ "VALUES(rb_no_sec.nextval,?,?,?,?,?,"
						+ "(SELECT NVL(MAX(group_id)+1,1) FROM replyBoard))"; 
						// 그룹아이디는 디폴트로 1을 넣어주고 최대값의 1을 더해서 새게시글의 그룹아이디 설정
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getPwd());
			ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
	}
	
	//게시글 상세보기
	public BoardVO contentDetail(String no, int type){
		BoardVO vo=new BoardVO();
		try{
			getConnection();
			
			//조회수 증가
			if(type==1){
				String sql="UPDATE replyBoard SET hit=hit+1 WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, no);
				ps.executeUpdate();
				ps.close();
			}
			
			//내용 출력
			String sql="SELECT no,name,subject,regDate,hit,content "
						+ "FROM replyBoard WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, no);
			rs=ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setRegDate(rs.getDate(4));
			vo.setHit(rs.getInt(5));
			vo.setContent(rs.getString(6));			
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		
		return vo;
	}
	
	//상세보기 번호 값 지정 함수
	public int coutNo(String no){
		int countno=0;
		try{
			getConnection();
			
			String sql="SELECT count(*) "
						+ "FROM (SELECT*FROM replyBoard WHERE no Between 1 AND ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, no);
			rs=ps.executeQuery();
			rs.next();
			
			countno=rs.getInt(1);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return countno;
	}
	
	//게시판 검색
	public List<BoardVO> contentFind(String fs, String ss, int fpage){
		List<BoardVO> flist=new ArrayList<>();

		try{
			getConnection();
			
			String sql="SELECT no, subject, name, regDate, hit, group_tab "
					+ "FROM replyBoard "
					+ "WHERE "+fs+" LIKE '%"+ss+"%'"
					+ "ORDER BY group_id DESC, group_step ASC";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			int i=0;
			int j=0;
			int pagecnt=(fpage*10)-10;
			
			while(rs.next()){
				if(i<10 && j>=pagecnt){	
					BoardVO vo=new BoardVO();
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setRegDate(rs.getDate(4));
					vo.setHit(rs.getInt(5));
				
					flist.add(vo);
					i++;
				}
				j++;
			}
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return flist;
	}
	
	//검색 페이지 개수 구하는 메서드
	public int findTotalPage(String fs, String ss){
		int ftotal=0;
		String ss2="%"+ss+"%";

		try{
			getConnection();
				
			String sql="SELECT CEIL(COUNT(*)/10) "
						+ "FROM (SELECT no, subject, name, regDate, hit, group_tab "
						+ "FROM replyBoard WHERE "+fs+" LIKE '%"+ss+"%')"; 
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			ftotal=rs.getInt(1);

			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
			
		return ftotal;
	}
		
	//검색 레코드수를 구하는 메서드
	public int findRowCount(String fs, String ss){
		int ftotal=0;

		try{
			getConnection();
				
			String sql="SELECT COUNT(*) "
						+ "FROM (SELECT no, subject, name, regDate, hit, group_tab "
						+ "FROM replyBoard WHERE "+fs+" LIKE '%"+ss+"%')"; 
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			ftotal=rs.getInt(1);

			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
			
		return ftotal;
	}
}

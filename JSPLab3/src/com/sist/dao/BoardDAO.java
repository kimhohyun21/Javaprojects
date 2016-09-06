package com.sist.dao;

import java.util.*;
import java.sql.*;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private final String URL="jdbc:oracle:thin:@211.238.142.88:1521:ORCL";
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
	 * 	- group_id(gi)   : 게시물과 답변을 묶어주는 변수
	 * 	- group_step(gs) : 게시물의 답변과 답변에 대한 답변을 구분하기 위해 사용하는 변수
	 * 	- group_tab(gt)  : 위치를 표기하는 변수 
	 * 
	 * 					
	 * 						gi		gs		gt
	 * AAAAAAA				2		0		0						
	 * 	=>KKKKKKK			2		1		1
	 * 	=>DDDDDDD			2		1 =>2	1
	 * 		=>OOOOOOO		2		2 =>3	2
	 * 		=>CCCCCCC		2		3 =>4	2
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
			String sql="SELECT no,name,NVL(email, ' '),subject,regDate,hit,content,depth "
						+ "FROM replyBoard WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, no);
			rs=ps.executeQuery();
			rs.next();
			
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setEmail(rs.getString(3));
			vo.setSubject(rs.getString(4));
			vo.setRegDate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			vo.setContent(rs.getString(7));
			vo.setDepth(rs.getInt(8));
			
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		
		return vo;
	}
	
	//수정하기 (modify)
	public boolean contentUpdate(BoardVO vo){
		boolean bCheck=false;
		try{
			//읽어오기
			getConnection();
			
			String sql="SELECT pwd FROM replyBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			rs=ps.executeQuery();
			rs.next();
			
			String db_pwd=rs.getString(1);
			
			if(db_pwd.equals(vo.getPwd())){
				//수정하기
				bCheck=true;
				sql="UPDATE replyBoard SET name=?, email=?, subject=?, content=? "
					+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getEmail());
				ps.setString(3, vo.getSubject());
				ps.setString(4, vo.getContent());
				ps.setInt(5, vo.getNo());
				ps.executeUpdate();
				
			}else{
				bCheck=false;
			}			
			rs.close();		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}
		
		return bCheck;
	}
	
	//상세보기 번호 값 지정 메서드
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
					+ "WHERE "+fs+" LIKE '%'||?||'%' "  //||문자열 결합 연산자 
					+ "ORDER BY group_id DESC, group_step ASC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
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
	
	//답글 달기
	public void reply(int no, BoardVO vo){
		try{
			getConnection();
			conn.setAutoCommit(false); //자동으로 인서트 되지 않게 설정
			/*
			 * 답변형 게시글의 변수 ==> 변수 초기값은 모두 0
			 * 	- group_id : 연관된 글을 모두 묶어주는 컬럼(답변을 묶어주는 번호)
			 * 	- group_tap : 몇번째 단계의 답글인지 나타내는 컬럼 (답변이미지 출력위치)
			 * 	- group_step : 글의 정렬 순서를 지정해주는 컬럼
			 *	
			 *								id			tab			step
			 *	새로운 글(50)					50			0			0	
			 *		|				
			 *		답변1						50			1			1
			 *		  |
			 *		   답변1의 답변				50			2			2
			 *			|
			 *			답변 1의 답변의 답변		50			3			3 (중간에 끼어드는 답변)
			 *		|
			 *		답변2						50			1			3 => 4									
			 *		  |
			 *		   답변 2의 답변				50			2			4 => 5
			 *
			 *		UPDATE replyBoard 
			 *		SET group_step=group_step+1
			 *		WHERE group_id=? AND group_step>?; /// 지정된 id의 게시글의 모임 중에 step이 중간에 삽입된 글의 이전 글의 step보다 큰 것만 증가 
			 */
			
			String sql="SELECT group_id, group_step, group_tab "
						+ "FROM replyBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no); 
			rs=ps.executeQuery();
			rs.next();
			
			//선택된 글의 변수 받아오기
			int gid=rs.getInt(1);
			int gstep=rs.getInt(2);
			int gtap=rs.getInt(3);
			rs.close();
			ps.close();
			
			//삽입된 답글로 인해 뒤로 밀리는 글의 group_step 값을 증가 시킴
			sql="UPDATE replyBoard "
				 + "SET group_step=group_step+1 "
				 + "WHERE group_id=? AND group_step>?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gid);
			ps.setInt(2, gstep); 
			ps.executeUpdate();
			ps.close();
			
			//답글 등록
			sql="INSERT INTO replyBoard "
				 + "(no, name, email, subject, content, pwd, group_id, group_step, group_tab, root) "
				 + "VALUES (rb_no_sec.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getPwd());
			ps.setInt(6, gid);
			ps.setInt(7, gstep+1);
			ps.setInt(8, gtap+1);
			ps.setInt(9, no); //답글이 달리는 글의 번호를 root번호로 삽입
			ps.executeUpdate();
			ps.close();			
			
			sql="UPDATE replyBoard SET depth=depth+1 WHERE no=?";
			ps=conn.prepareStatement(sql);			
			ps.setInt(1, no);
			ps.executeUpdate();
			
			conn.commit();
			System.out.println(sql);
		}catch(Exception e){
			try{
				conn.rollback(); // 에러가 났을 경우 롤백
			}catch(Exception ex){
				ex.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try{
				conn.setAutoCommit(true);				
			}catch(Exception e){
				e.printStackTrace();
			}
			disConnection();
		}
	}
	
	//삭제하기
	public boolean delete(int no, String pwd){
		boolean bCheck=false;
		
		try{
			getConnection();
			//패스워드 체크
			String sql="Select pwd FROM replyBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			rs.next();
			
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(pwd)){				
				sql="SELECT root, depth, group_step, group_id FROM replyBoard WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				rs=ps.executeQuery();
				rs.next();
				
				int root=rs.getInt(1);
				int depth=rs.getInt(2);
				int gstep=rs.getInt(3);
				int gid=rs.getInt(4);
				rs.close();
				ps.close();
				
				//댓글이 달린 글은 삭제 할 수 없음
				if(depth==0){ // depth 댓글이 없는 일반적인 게시글, 혹은 댓글이 없는 댓글, depth는 직속 답글의 숫자
					sql="DELETE FROM replyBoard WHERE no=?";  
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
					ps.close();
					
					//삭제된 답글로 인해 앞으로 당겨지는 글의 group_step 값을 감소 시킴
					sql="UPDATE replyBoard "
						 + "SET group_step=group_step-1 "
						 + "WHERE group_id=? AND group_step>?";
					
					ps=conn.prepareStatement(sql);
					ps.setInt(1, gid);
					ps.setInt(2, gstep);
					ps.executeUpdate();
					ps.close();
					
					//삭제된 글에 대해서 	
					if(root!=0){ // DB에서 입력한 글이 아니라 글쓰기로 등록된 글만 삭제,  root는 부모 글의 번호
						sql="UPDATE replyBoard SET depth=depth-1 WHERE no=?";
						ps=conn.prepareStatement(sql);
						ps.setInt(1, root);
						ps.close();
					}					
					bCheck=true;
				}else{
					bCheck=false;
				}
				
			}else{
				bCheck=false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			disConnection();
		}		
		
		return bCheck;
	}

}

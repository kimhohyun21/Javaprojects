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
	
	//����̹� ���
	public BoardDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//����Ŭ ���� ����
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//����Ŭ ����
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL, USER, PWD);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/* ���
	 * 
	 * <�亯�� �Խ��� ���ۿ� �ʿ��� ����>
	 * 	- group_id(gi)   : �Խù��� �亯�� �������ִ� ����
	 * 	- group_step(gs) : �Խù��� �亯�� �亯�� ���� �亯�� �����ϱ� ���� ����ϴ� ����
	 * 	- group_tab(gt)  : ��ġ�� ǥ���ϴ� ����
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
	 * <�Խ����� ��ü���� ���α׷� ����>
	 * 	1. �Խù� ��� ��ȸ
	 * 	2. �Խù� �Է� ��    C(create)
	 * 	3. �Խù� �亯	  R(reply)	
	 *	4. �Խù� ����	  U(update)	
	 *	5. �Խù� ����	  D(delete)
	 */
	
	/*
	 * <�Խ��� ��� ��ȸ(list.jsp)>
	 *	- �Խ��� ��� ��ȸ�� �Խ����� ������ �Ǵ� �ʱ����α׷�.
	 *	- �Խ��� ����� ��ȸ�� ��, ���̴� ��� ����� �����ϴ� ������ �׺���̼��� �����
	 *		=> ���� ����, �ʱⰪ �ο�
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
	
	//��ü ������ ���� ���ϴ� �޼���
	public int boardTotalPage(){
		int total=0;
		try{
			getConnection();
			
			String sql="SELECT CEIL(COUNT(*)/10) " //��ü �Խñ��� ���� üũ�Ͽ� 10���� ������ �ְ� �ø��� �ϸ� ������ ��
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
	
	//��ü ���ڵ���� ���ϴ� �޼���
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
	 * <�Խñ� �߰��ϴ� ���>
	 * INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id)
     *  VALUES(rb_no_sec.nextval,'���ؿ�','','�亯�� �Խ���', '�亯�� �Խ��� �����', '1234',15); 
	 * 
	 */	
	public void boardInsert(BoardVO vo){
		try{
			getConnection();
			
			String sql="INSERT INTO replyBoard(no,name,email,subject,content,pwd,group_id) "
						+ "VALUES(rb_no_sec.nextval,?,?,?,?,?,"
						+ "(SELECT NVL(MAX(group_id)+1,1) FROM replyBoard))"; 
						// �׷���̵�� ����Ʈ�� 1�� �־��ְ� �ִ밪�� 1�� ���ؼ� ���Խñ��� �׷���̵� ����
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
	
	//�Խñ� �󼼺���
	public BoardVO contentDetail(String no, int type){
		BoardVO vo=new BoardVO();
		try{
			getConnection();
			
			//��ȸ�� ����
			if(type==1){
				String sql="UPDATE replyBoard SET hit=hit+1 WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, no);
				ps.executeUpdate();
				ps.close();
			}
			
			//���� ���
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
	
	//�󼼺��� ��ȣ �� ���� �Լ�
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
	
	//�Խ��� �˻�
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
	
	//�˻� ������ ���� ���ϴ� �޼���
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
		
	//�˻� ���ڵ���� ���ϴ� �޼���
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

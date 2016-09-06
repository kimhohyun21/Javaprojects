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
	 * 	- group_id(gi)   : �Խù��� �亯�� �����ִ� ����
	 * 	- group_step(gs) : �Խù��� �亯�� �亯�� ���� �亯�� �����ϱ� ���� ����ϴ� ����
	 * 	- group_tab(gt)  : ��ġ�� ǥ���ϴ� ���� 
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
	
	//�����ϱ� (modify)
	public boolean contentUpdate(BoardVO vo){
		boolean bCheck=false;
		try{
			//�о����
			getConnection();
			
			String sql="SELECT pwd FROM replyBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			rs=ps.executeQuery();
			rs.next();
			
			String db_pwd=rs.getString(1);
			
			if(db_pwd.equals(vo.getPwd())){
				//�����ϱ�
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
	
	//�󼼺��� ��ȣ �� ���� �޼���
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
					+ "WHERE "+fs+" LIKE '%'||?||'%' "  //||���ڿ� ���� ������ 
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
	
	//��� �ޱ�
	public void reply(int no, BoardVO vo){
		try{
			getConnection();
			conn.setAutoCommit(false); //�ڵ����� �μ�Ʈ ���� �ʰ� ����
			/*
			 * �亯�� �Խñ��� ���� ==> ���� �ʱⰪ�� ��� 0
			 * 	- group_id : ������ ���� ��� �����ִ� �÷�(�亯�� �����ִ� ��ȣ)
			 * 	- group_tap : ���° �ܰ��� ������� ��Ÿ���� �÷� (�亯�̹��� �����ġ)
			 * 	- group_step : ���� ���� ������ �������ִ� �÷�
			 *	
			 *								id			tab			step
			 *	���ο� ��(50)					50			0			0	
			 *		|				
			 *		�亯1						50			1			1
			 *		  |
			 *		   �亯1�� �亯				50			2			2
			 *			|
			 *			�亯 1�� �亯�� �亯		50			3			3 (�߰��� ������ �亯)
			 *		|
			 *		�亯2						50			1			3 => 4									
			 *		  |
			 *		   �亯 2�� �亯				50			2			4 => 5
			 *
			 *		UPDATE replyBoard 
			 *		SET group_step=group_step+1
			 *		WHERE group_id=? AND group_step>?; /// ������ id�� �Խñ��� ���� �߿� step�� �߰��� ���Ե� ���� ���� ���� step���� ū �͸� ���� 
			 */
			
			String sql="SELECT group_id, group_step, group_tab "
						+ "FROM replyBoard WHERE no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no); 
			rs=ps.executeQuery();
			rs.next();
			
			//���õ� ���� ���� �޾ƿ���
			int gid=rs.getInt(1);
			int gstep=rs.getInt(2);
			int gtap=rs.getInt(3);
			rs.close();
			ps.close();
			
			//���Ե� ��۷� ���� �ڷ� �и��� ���� group_step ���� ���� ��Ŵ
			sql="UPDATE replyBoard "
				 + "SET group_step=group_step+1 "
				 + "WHERE group_id=? AND group_step>?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gid);
			ps.setInt(2, gstep); 
			ps.executeUpdate();
			ps.close();
			
			//��� ���
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
			ps.setInt(9, no); //����� �޸��� ���� ��ȣ�� root��ȣ�� ����
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
				conn.rollback(); // ������ ���� ��� �ѹ�
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
	
	//�����ϱ�
	public boolean delete(int no, String pwd){
		boolean bCheck=false;
		
		try{
			getConnection();
			//�н����� üũ
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
				
				//����� �޸� ���� ���� �� �� ����
				if(depth==0){ // depth ����� ���� �Ϲ����� �Խñ�, Ȥ�� ����� ���� ���, depth�� ���� ����� ����
					sql="DELETE FROM replyBoard WHERE no=?";  
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					ps.executeUpdate();
					ps.close();
					
					//������ ��۷� ���� ������ ������� ���� group_step ���� ���� ��Ŵ
					sql="UPDATE replyBoard "
						 + "SET group_step=group_step-1 "
						 + "WHERE group_id=? AND group_step>?";
					
					ps=conn.prepareStatement(sql);
					ps.setInt(1, gid);
					ps.setInt(2, gstep);
					ps.executeUpdate();
					ps.close();
					
					//������ �ۿ� ���ؼ� 	
					if(root!=0){ // DB���� �Է��� ���� �ƴ϶� �۾���� ��ϵ� �۸� ����,  root�� �θ� ���� ��ȣ
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

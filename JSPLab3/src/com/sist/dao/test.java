package com.sist.dao;

import java.util.*;
import java.sql.*;

public class test {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL = "jdbc:oracle:thin:@211.238.142.88:1521:ORCL";

   // ����̹� ���
   public test() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // ����Ŭ ����
   public void disConnection() {
      try {
         if (ps != null)
            ps.close();
         if (conn != null)
            conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // ����Ŭ ����
   public void getConnection() {
      try {
         conn = DriverManager.getConnection(URL, "scott", "tiger");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   /*
    * �� �亯�� �Խ��� ���ۿ� �ʿ��� ���� - groupId(gi) : �Խù��� �亯�� �������ִ� ���� - groupSetp(gs) :
    * �Խù��� �亯�� - groupTab(gt) : ��ġ ����
    * 
    * gi gs gt �Խñ�2 2 0 0 - �Խñ�2-��� 1 2 1 1 - �Խñ�2-��� 2 2 1 1 - �Խñ�2-���2-���1 2
    * 2 2 - �Խñ�2-���2-���2 2 2 2 �Խñ� 1 1 0 0 - �Խñ�1-��� 1 1 1 1
    * 
    * �� �Խ��� ��ü���� ���α׷� ���� - �Խù� ��� ��ȸ - �Խ��� �Է��� - �Խ��� �Խù� ���� - �Խù� �亯 - �Խù� ����
    */

   /*
    * �Խ��� ��� ��ȸ (list.jsp) - �Խ��� ��� ��ȸ�� �Խ����� ����Ǵ� �ʱ� ���α׷��� �ش��. - �Խù��� ����� ��ȸ��
    * ��, ������ �� ��� ����� �����ϴ�(��, 10��, 15�� ��) ������ ���̰��̼��� �����.
    */

   public List<BoardVO> boardListData(int page) {
      List<BoardVO> list = new ArrayList<>();
      try {
         getConnection();
         String sql = "SELECT no, subject, name, regdate, hit, group_tab " + "FROM replyBoard "
               + "ORDER BY group_id DESC, group_step ASC";
         ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
         int i = 0;
         int j = 0;
         int pagecnt = (page * 10) - 10;
         while (rs.next()) {
            if (i < 10 && j >= pagecnt) {
               BoardVO vo = new BoardVO();
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
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
      return list;
   }

   public int boardTotalPage() {
      int total = 0;
      try {
         getConnection();
         String sql = "SELECT CEIL(COUNT(*)/10) FROM replyBoard";
         ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
         rs.next();
         total = rs.getInt(1);
         rs.close();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
      return total;
   }

   public int boardRowCount() {
      int total = 0;
      try {
         getConnection();
         String sql = "SELECT COUNT(*) FROM replyBoard";
         ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();
         rs.next();
         total = rs.getInt(1);
         rs.close();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
      return total;
   }

   /*
    * INSERT INTO replyBoard(no, name, email, subject, content, pwd, group_id)
    * VALUES (1, '������','', '�ȳ��ϼ���', '�ݰ����ϴ�', '1234',1);
    */

   // �۾���
   public void boardInsert(BoardVO vo) {
      try {
         getConnection();
         String sql = "INSERT INTO replyBoard (no, name, email, subject, content, pwd, group_id) "
               + "VALUES(REPLYBOARD_NO_SEQ.nextval,?,?,?,?,?,(SELECT NVL(MAX(group_id)+1,1) FROM replyBoard))";
         ps = conn.prepareStatement(sql);
         ps.setString(1, vo.getName());
         ps.setString(2, vo.getEmail());
         ps.setString(3, vo.getSubject());
         ps.setString(4, vo.getContent());
         ps.setString(5, vo.getPwd());
         ps.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
   }

   // ���뺸��
   public BoardVO boardContent(int no, int type) {
      BoardVO vo = new BoardVO();
      try {
         // ��ȸ�� ����
         getConnection();
         if (type == 1) { // ���뺸�� Ÿ������ ����
            String sql = "UPDATE replyBoard SET " + "hit=hit+1 " + "WHERE no=?"; // ��ȸ��
                                                                  // 1
                                                                  // ����
            ps = conn.prepareStatement(sql);
            ps.setInt(1, no);
            // ����
            ps.executeUpdate(); // �ڵ� commit;
            ps.close();
         }
         String sql = "SELECT no, name, NVL(email,' '), subject, content, regdate, hit " + "FROM replyBoard "
               + "WHERE no=?"; // ���� �ҷ�����
         ps = conn.prepareStatement(sql);
         ps.setInt(1, no);

         ResultSet rs = ps.executeQuery();
         rs.next();
         vo.setNo(rs.getInt(1));
         vo.setName(rs.getString(2));
         vo.setEmail(rs.getString(3));
         vo.setSubject(rs.getString(4));
         vo.setContent(rs.getString(5));
         vo.setRegDate(rs.getDate(6));
         vo.setHit(rs.getInt(7));
         rs.close();

      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
      return vo;
   }

   // �����ϱ�(modify)
   public boolean boardUpdate(BoardVO vo) {
      boolean bCheck = false;
      try {
         // �о����
         getConnection();
         String sql = "SELECT pwd FROM replyBoard " + "WHERE no=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, vo.getNo());
         ResultSet rs = ps.executeQuery();
         rs.next();
         String db_pwd = rs.getString(1);
         rs.close();
         if (db_pwd.equals(vo.getPwd())) {
            // �����ϱ�
            // WEHRE fs LIKE '%||?||%'
            bCheck = true;
            sql = "UPDATE replyBoard SET name=?, email=?, subject=?, content=? " + "WHERE no=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, vo.getName());
            ps.setString(2, vo.getEmail());
            ps.setString(3, vo.getSubject());
            ps.setString(4, vo.getContent());
            ps.setInt(5, vo.getNo());
            ps.executeUpdate();
         } else {
            bCheck = false;
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
      return bCheck;
   }

   // ã��
   public List<BoardVO> boardFindData(String fs, String ss) {
      List<BoardVO> list = new ArrayList<>();
      try {
         getConnection();
         String sql = "SELECT no, subject, name, regdate, hit, group_tab FROM replyBoard WHERE " + fs
               + " LIKE '%'||?||'%' ";
         ps = conn.prepareStatement(sql);
         ps.setString(1, ss);
         ResultSet rs = ps.executeQuery();

         while (rs.next()) {
            BoardVO vo = new BoardVO();
            vo.setNo(rs.getInt(1));
            vo.setSubject(rs.getString(2));
            vo.setName(rs.getString(3));
            vo.setRegDate(rs.getDate(4));
            vo.setHit(rs.getInt(5));
            vo.setGroup_tab(rs.getInt(6));
            list.add(vo);
         }
         rs.close();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         disConnection();
      }
      return list;
   }

   // ��۴ޱ�(reply)
   public void boardReply(int pno, BoardVO vo) {
      try {
         getConnection();
         conn.setAutoCommit(false);
         /*
          * ����� �Խñ� - �� �� group-id, group-step, group-tab �� �� �� �ʱⰪ = 0 -
          * group_id : ������ ���� �����ִ� �÷� (����� �����ִ� ��ȣ) - group_tab : �� ��° �ܰ���
          * ������� ��Ÿ���� �÷� (����̹��� �����ġ) - group_step : ���� ���� ������ �������ִ� �÷�
          * 
          * UPDATE replyBoard SET group_step=group_step+1 WHERE group_id=?
          * AND group_step>?
          */
         String sql = "SELECT group_id, group_step, group_tab " + "FROM replyBoard WHERE no=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, pno); // DB �÷����δ� root
         ResultSet rs = ps.executeQuery();
         rs.next();
         int gi = rs.getInt(1);
         int gs = rs.getInt(2);
         int gt = rs.getInt(3);

         rs.close();
         ps.close();
         // group_step �� 1 ���� ��Ŵ
         sql = "UPDATE replyBoard SET " +"group_step=group_step+1 " + "WHERE group_id=? AND group_step>?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, gi);
         ps.setInt(2, gs);
         ps.executeUpdate();
         ps.close();

         sql = "INSERT INTO replyBoard (no, name, email, subject, content, pwd, group_id, group_step, group_tab, root) "
               + "VALUES(REPLYBOARD_NO_SEQ.nextval,?,?,?,?,?,?,?,?,?)";
         ps = conn.prepareStatement(sql);
         ps.setString(1, vo.getName());
         ps.setString(2, vo.getEmail());
         ps.setString(3, vo.getSubject());
         ps.setString(4, vo.getContent());
         ps.setString(5, vo.getPwd());
         ps.setInt(6, gi);
         ps.setInt(7, gs + 1);
         ps.setInt(8, gt + 1);
         ps.setInt(9, pno);
         ps.executeUpdate();
         ps.close();

         sql = "UPDATE replyBoard SET depth=depth+1 WHERE no=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, pno);
         ps.executeUpdate();

         conn.commit();

      } catch (Exception e) {
         try {
            conn.rollback();
         } catch (Exception e2) {
            e.printStackTrace();
         }
      } finally {
         try {
            conn.setAutoCommit(true);
         } catch (Exception e2) {
            e2.printStackTrace();
         } finally {
            disConnection();
         }
      }
   }

   // �����ϱ�
   public boolean boardDelete(int no, String pwd) {
      boolean bCheck = false;
      try {
         getConnection();
         // �н����� üũ (pwd �о�;���)
         String sql = "SELECT pwd FROM replyBoard " + "WHERE no=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, no);

         ResultSet rs = ps.executeQuery();
         rs.next();
         String db_pwd = rs.getString(1);
         rs.close();

         if (db_pwd.equals(pwd)) {
            bCheck = true;
            sql = "SELECT root, depth FROM replyBoard WHERE no=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, no);
            rs = ps.executeQuery();
            rs.next();
            int root = rs.getInt(1);
            int depth = rs.getInt(2);
            rs.close();
            ps.close();

            if (depth == 0) { // ��۾��� �Ϲ����� �Խñ�, ������ ���
               sql = "DELETE FROM replyBoard " + "WHERE no=?";
               ps = conn.prepareStatement(sql);
               ps.setInt(1, no);
               ps.executeUpdate();
               ps.close();
            }

            if (root != 0) {
               sql = "UPDATE replyBoard SET " + "depth=depth-1 " + "WHERE no=?";
               ps = conn.prepareStatement(sql);
               ps.setInt(1, root);
               ps.executeUpdate();
            }
         } else {
            bCheck = false;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      return bCheck;
   }
}
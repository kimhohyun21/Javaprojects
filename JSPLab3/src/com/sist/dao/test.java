package com.sist.dao;

import java.util.*;
import java.sql.*;

public class test {
   private Connection conn;
   private PreparedStatement ps;
   private final String URL = "jdbc:oracle:thin:@211.238.142.88:1521:ORCL";

   // 드라이버 등록
   public test() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // 오라클 해제
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

   // 오라클 연결
   public void getConnection() {
      try {
         conn = DriverManager.getConnection(URL, "scott", "tiger");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   /*
    * ※ 답변형 게시판 제작에 필요한 변수 - groupId(gi) : 게시물과 답변을 구분해주는 변수 - groupSetp(gs) :
    * 게시물의 답변과 - groupTab(gt) : 위치 변수
    * 
    * gi gs gt 게시글2 2 0 0 - 게시글2-댓글 1 2 1 1 - 게시글2-댓글 2 2 1 1 - 게시글2-댓글2-댓글1 2
    * 2 2 - 게시글2-댓글2-댓글2 2 2 2 게시글 1 1 0 0 - 게시글1-댓글 1 1 1 1
    * 
    * ※ 게시판 전체적인 프로그램 구조 - 게시물 목록 조회 - 게시판 입력폼 - 게시판 게시물 수정 - 게시물 답변 - 게시물 삭제
    */

   /*
    * 게시판 목록 조회 (list.jsp) - 게시판 목록 조회는 게시판이 실행되는 초기 프로그램에 해당됨. - 게시물의 목록을 조회할
    * 때, 페이지 당 출력 목록을 제한하는(예, 10개, 15개 등) 페이지 네이게이션을 사용함.
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
    * VALUES (1, '김혜경','', '안녕하세요', '반갑습니다', '1234',1);
    */

   // 글쓰기
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

   // 내용보기
   public BoardVO boardContent(int no, int type) {
      BoardVO vo = new BoardVO();
      try {
         // 조회수 증가
         getConnection();
         if (type == 1) { // 내용보기 타입으로 지정
            String sql = "UPDATE replyBoard SET " + "hit=hit+1 " + "WHERE no=?"; // 조회수
                                                                  // 1
                                                                  // 증가
            ps = conn.prepareStatement(sql);
            ps.setInt(1, no);
            // 실행
            ps.executeUpdate(); // 자동 commit;
            ps.close();
         }
         String sql = "SELECT no, name, NVL(email,' '), subject, content, regdate, hit " + "FROM replyBoard "
               + "WHERE no=?"; // 내용 불러오기
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

   // 수정하기(modify)
   public boolean boardUpdate(BoardVO vo) {
      boolean bCheck = false;
      try {
         // 읽어오기
         getConnection();
         String sql = "SELECT pwd FROM replyBoard " + "WHERE no=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, vo.getNo());
         ResultSet rs = ps.executeQuery();
         rs.next();
         String db_pwd = rs.getString(1);
         rs.close();
         if (db_pwd.equals(vo.getPwd())) {
            // 수정하기
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

   // 찾기
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

   // 답글달기(reply)
   public void boardReply(int pno, BoardVO vo) {
      try {
         getConnection();
         conn.setAutoCommit(false);
         /*
          * 답글형 게시글 - 글 수 group-id, group-step, group-tab → 글 수 초기값 = 0 -
          * group_id : 연관된 글을 묶어주는 컬럼 (답글을 묶어주는 번호) - group_tab : 몇 번째 단계의
          * 답글인지 나타내는 컬럼 (답글이미지 출력위치) - group_step : 글의 정렬 순서를 지정해주는 컬럼
          * 
          * UPDATE replyBoard SET group_step=group_step+1 WHERE group_id=?
          * AND group_step>?
          */
         String sql = "SELECT group_id, group_step, group_tab " + "FROM replyBoard WHERE no=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, pno); // DB 컬럼으로는 root
         ResultSet rs = ps.executeQuery();
         rs.next();
         int gi = rs.getInt(1);
         int gs = rs.getInt(2);
         int gt = rs.getInt(3);

         rs.close();
         ps.close();
         // group_step 값 1 증가 시킴
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

   // 삭제하기
   public boolean boardDelete(int no, String pwd) {
      boolean bCheck = false;
      try {
         getConnection();
         // 패스워드 체크 (pwd 읽어와야함)
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

            if (depth == 0) { // 댓글없는 일반적인 게시글, 안쪽의 댓글
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
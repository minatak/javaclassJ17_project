package study;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class VocaDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	VocaVO vo = null;	
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {} 
			finally {
				pstmtClose();
			}
		}
	}

	// 단어장 등록
	public int setVocaInputOk(VocaVO vo) {
		 int res = 0;
		 
     try {
       sql = "INSERT INTO voca values (default,?,?,?,?,?,'')";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, vo.getMemberMid());
       pstmt.setString(2, vo.getCategory());
       pstmt.setString(3, vo.getWord());
       pstmt.setString(4, vo.getMeaning());
       pstmt.setString(5, vo.getPartOfSpeech());
       res = pstmt.executeUpdate();
     } catch (SQLException e) {
       System.out.println("SQL 오류 : " + e.getMessage());
     } finally {
       pstmtClose();
     }
     return res;

	}

	// 아이디별로 만든 단어장 찾기
	public ArrayList<VocaVO> getVocaList(String mid) {
    ArrayList<VocaVO> vos = new ArrayList<VocaVO>();
    try {
      sql = "SELECT category, COUNT(*) as wordCnt FROM voca WHERE memberMid = ? GROUP BY category ORDER BY idx DESC";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, mid);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        VocaVO vo = new VocaVO();
        vo.setCategory(rs.getString("category"));
        vo.setWordCnt(rs.getString("wordCnt"));
        vos.add(vo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류 : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vos;
	}

	// 단어장 내용 꺼내오기
	public ArrayList<VocaVO> getVocaDetail(String mid, String category) {
		 ArrayList<VocaVO> vos = new ArrayList<VocaVO>();
	    try {
	      sql = "SELECT * FROM voca WHERE memberMid = ? and category = ? ORDER BY idx DESC";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, mid);
	      pstmt.setString(2, category);
	      rs = pstmt.executeQuery();

	      while (rs.next()) {
          VocaVO vo = new VocaVO();
          vo.setIdx(rs.getInt("idx"));
          vo.setMemberMid(rs.getString("memberMid"));
          vo.setCategory(rs.getString("category"));
          vo.setWord(rs.getString("word"));
          vo.setMeaning(rs.getString("meaning"));
          vo.setPartOfSpeech(rs.getString("partOfSpeech"));
          vo.setExample(rs.getString("example"));
         // vo.setWordCnt(rs.getString("wordCnt"));
          vos.add(vo);
	      }
	    } catch (SQLException e) {
	      System.out.println("SQL 오류 : " + e.getMessage());
	    } finally {
	      rsClose();
	    }
	    return vos;
		}


	
	
	
	
}

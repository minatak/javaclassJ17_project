package study;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class VocaTestDAO {
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
	
  public void setTestResult(String memberMid, String category, int score) {
  	int res = 0;
  	
  	try {
      sql = "INSERT INTO vocaTest (memberMid, category, score, testDate) VALUES (?, ?, ?, default)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, memberMid);
      pstmt.setString(2, category);
      pstmt.setInt(3, score);
      pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류: " + e.getMessage());
    } finally {
      pstmtClose();
    }
  }
	
  /*
  public ArrayList<VocaTestVO> getTestResults() {
    ArrayList<VocaTestVO> results = new ArrayList<>();
    try {
			String sql = "SELECT memberMid, category, score, testDate FROM vocaTest ORDER BY score DESC, testDate ASC";
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery() {
      	 
    }
      while (rs.next()) {
        VocaTestResult result = new VocaTestResult();
        result.setMemberMid(rs.getString("memberMid"));
        result.setCategory(rs.getString("category"));
        result.setScore(rs.getInt("score"));
        result.setTestDate(rs.getTimestamp("testDate"));
        results.add(result);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return results;
  }
	*/

}

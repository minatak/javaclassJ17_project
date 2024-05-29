package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.report.ReportVO;
import common.GetConn;

public class AdminDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
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

	// 회원 신고내역 저장하기 
	public int setMemberReportInput(ReportVO vo) {
		int res = 0;
		try {
			sql = "insert into report values (default, ?, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getReportedMid());
			pstmt.setString(2, vo.getReportingMid());
			pstmt.setString(3, vo.getReason());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
			return res;
	}

	// 신고회원 전체 목록
	public ArrayList<ReportVO> getReportList() {
		ArrayList<ReportVO> vos = new ArrayList<ReportVO>();
		try {
			sql = "SELECT DATE_FORMAT(r.reportDate, '%Y-%m-%d %H:%i') AS reportDate, r.*, m.mid AS mid, m.nickName AS nickName, m.name AS name, m.email AS email, m.gender AS gender, m.birthday AS birthday, m.startDate AS startDate,  "
					+ "m.userDel AS userDel FROM report r JOIN member m ON r.reportedMid = m.mid ORDER BY r.idx DESC;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			ReportVO vo = null;
			while(rs.next()) {
				vo = new ReportVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setReportDate(rs.getString("reportedMid"));
				vo.setReportingMid(rs.getString("reportingMid"));
				vo.setReason(rs.getString("reason"));
				vo.setReportDate(rs.getString("reportDate"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setShow(rs.getString("userDel"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return vos;
	}

	/*
	// 회원 삭제처리 (멤버 테이블에서만 삭제시켰음)
	public int MemberDeleteOk(String mid) {
		int res = 0;
		try {
			sql = "delete from member where mid = ? \"delete from report where reportedMid = ?\"";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
		return res;
	}
	*/
	
	// 회원 삭제처리 (멤버, 신고 테이블 둘 다 삭제하기 -> 트랜잭션으로 처리해야 함)
	public int MemberDeleteOk(String mid) {
	   int res = 0;
	   try {
	       // 트랜잭션 시작
	       conn.setAutoCommit(false);
	       
	       // member 테이블에서 회원 삭제
	       String sql1 = "delete from member where mid = ?";
	       pstmt = conn.prepareStatement(sql1);
	       pstmt.setString(1, mid);
	       res = pstmt.executeUpdate();
	
	       // report 테이블에서 회원 관련 데이터 삭제
	       String sql2 = "delete from report where reportedMid = ?";
	       pstmt = conn.prepareStatement(sql2);
	       pstmt.setString(1, mid);
	       res += pstmt.executeUpdate();
	
	       // 트랜잭션 커밋
	       conn.commit();
	   } catch (SQLException e) {
	       try {
	           // 트랜잭션 롤백
	           conn.rollback();
	       } catch (SQLException rollbackEx) {
	           System.out.println("롤백 오류 : " + rollbackEx.getMessage());
	       }
	       System.out.println("SQL 오류 : " + e.getMessage());
	   } finally {
	       try {
	           // 원래대로 자동 커밋 설정
	           conn.setAutoCommit(true);
	       } catch (SQLException autoCommitEx) {
	           System.out.println("자동 커밋 설정 오류 : " + autoCommitEx.getMessage());
	       }
	       pstmtClose();            
	   }
	   return res;
	}

	
	
	

	// 회원 감추기 처리
	public int MemberHideOk(String mid) {
		int res = 0;
		try {
			sql = "update member set userDel = 'OK' where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 신고 취소 처리
	public int CancelReportOk(String mid) {
		int res = 0;
		try {
			sql = "delete from report where reportedMid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
		return res;
	}
	
	
	
	
	
}

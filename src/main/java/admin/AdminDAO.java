package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.report.ReportVO;
import common.GetConn;
import member.MemberVO;

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
	       sql = "delete from member where mid = ?";
	       pstmt = conn.prepareStatement(sql);
	       pstmt.setString(1, mid);
	       pstmt.executeUpdate();
	       pstmtClose();
	
	       // report 테이블에서 회원 관련 데이터 삭제
	       sql = "delete from report where reportedMid = ?";
	       pstmt = conn.prepareStatement(sql);
	       pstmt.setString(1, mid);
	       res = pstmt.executeUpdate();
	
	       // 트랜잭션 커밋
	       conn.commit();
	   } catch (SQLException e) {
	  	 System.out.println("SQL 오류 : " + e.getMessage());
       try {
           // 트랜잭션 롤백
           conn.rollback();
       } catch (SQLException rollbackEx) {
           System.out.println("롤백 오류 : " + rollbackEx.getMessage());
       }
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

	//각 레벨별 건수 구하기
	public int getTotRecCnt(int level) {
		int totRecCnt = 0;
		try {
			if(level == 999) {
				sql = "select count(*) as cnt from member";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select count(*) as cnt  from member where level = ? order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return totRecCnt;
	}

	// 회원 전체 리스트
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "SELECT * FROM member ORDER BY idx DESC LIMIT ?, ?";
			
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, nativeLanguage);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			MemberVO vo = null;
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setPhoto(rs.getString("photo"));
				vo.setCountry(rs.getString("country"));
				vo.setCity(rs.getString("city"));
				vo.setNativeLanguage(rs.getString("nativeLanguage"));
				vo.setLearningLanguage(rs.getString("learningLanguage"));
				vo.setLanguageLevel(rs.getString("languageLevel"));
				vo.setContent(rs.getString("content"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setLevel(rs.getInt("level"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				
				if(vo.getCountry().equals("한국")) vo.setMyFlag("KR.jpg");
				else if(vo.getCountry().equals("미국")) vo.setMyFlag("US.gif");
				else if(vo.getCountry().equals("스페인")) vo.setMyFlag("ES.gif");
				else if(vo.getCountry().equals("프랑스")) vo.setMyFlag("FR.gif");
				else if(vo.getCountry().equals("일본")) vo.setMyFlag("JP.gif");
				else if(vo.getCountry().equals("독일")) vo.setMyFlag("DE.gif");
				else if(vo.getCountry().equals("중국")) vo.setMyFlag("CN.gif");
				else if(vo.getCountry().equals("러시아")) vo.setMyFlag("RU.gif");
				else  vo.setMyFlag("noFlag");
				
				if(vo.getNativeLanguage().equals("한국어")) vo.setMyLangFlag("KR.jpg");
				else if(vo.getNativeLanguage().equals("영어")) vo.setMyLangFlag("US.gif");
				else if(vo.getNativeLanguage().equals("스페인어")) vo.setMyLangFlag("ES.gif");
				else if(vo.getNativeLanguage().equals("프랑스어")) vo.setMyLangFlag("FR.gif");
				else if(vo.getNativeLanguage().equals("일본어")) vo.setMyLangFlag("JP.gif");
				else if(vo.getNativeLanguage().equals("독일어")) vo.setMyLangFlag("DE.gif");
				else if(vo.getNativeLanguage().equals("중국어")) vo.setMyLangFlag("CN.gif");
				else if(vo.getNativeLanguage().equals("러시아어")) vo.setMyLangFlag("RU.gif");
				else  vo.setMyLangFlag("noFlag");
				
				if(vo.getLearningLanguage().equals("한국어")) vo.setWantLangFlag("KR.jpg");
				else if(vo.getLearningLanguage().equals("영어")) vo.setWantLangFlag("US.gif");
				else if(vo.getLearningLanguage().equals("스페인어")) vo.setWantLangFlag("ES.gif");
				else if(vo.getLearningLanguage().equals("프랑스어")) vo.setWantLangFlag("FR.gif");
				else if(vo.getLearningLanguage().equals("일본어")) vo.setWantLangFlag("JP.gif");
				else if(vo.getLearningLanguage().equals("독일어")) vo.setWantLangFlag("DE.gif");
				else if(vo.getLearningLanguage().equals("중국어")) vo.setWantLangFlag("CN.gif");
				else if(vo.getLearningLanguage().equals("러시아어")) vo.setWantLangFlag("RU.gif");
				else vo.setWantLangFlag("noFlag");
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원 감추기 처리
	public int MemberShowOk(String mid) {
		int res = 0;
		try {
			sql = "update member set userDel = 'NO' where mid=?";
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

	//신규회원 건수
	public int getNewMemberListCount() {
		int mCount = 0;
		try { 
			sql = "SELECT COUNT(*) AS cnt FROM member WHERE TIMESTAMPDIFF(DAY, startDate, CURDATE()) <= 10";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		  if (rs.next()) {
			  mCount = rs.getInt("cnt");
		  }
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return mCount;
	}

	// 일주일 이내로 신고가 접수된 회원 건수
	public int getNewReportListCount() {
		int rCount = 0;
		try { 
			sql = "SELECT COUNT(*) AS cnt FROM report WHERE TIMESTAMPDIFF(DAY, reportDate, CURDATE()) <= 7";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		  if (rs.next()) {
		  	rCount = rs.getInt("cnt");
		  }
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return rCount;
	}

	// 탈퇴 신청한 회원 (회원레벨이 99일경우 탈퇴 신청한 회원임)
	public int getMemberDeleteCount() {
		int m99Count = 0;
		try {
			sql = "select count(idx) as cnt from member where level = 99";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
        m99Count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return m99Count;
	}

	// 숨김 처리한 회원 꺼내오기
	public ArrayList<MemberVO> getHiddenMembers() {
		ArrayList<MemberVO> hideMemberList = new ArrayList<MemberVO>();
		try {
			sql = "SELECT * FROM member where userDel = 'OK' ORDER BY idx DESC";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			MemberVO vo = null;
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setPhoto(rs.getString("photo"));
				vo.setCountry(rs.getString("country"));
				vo.setCity(rs.getString("city"));
				vo.setNativeLanguage(rs.getString("nativeLanguage"));
				vo.setLearningLanguage(rs.getString("learningLanguage"));
				vo.setLanguageLevel(rs.getString("languageLevel"));
				vo.setContent(rs.getString("content"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setLevel(rs.getInt("level"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				
				if(vo.getCountry().equals("한국")) vo.setMyFlag("KR.jpg");
				else if(vo.getCountry().equals("미국")) vo.setMyFlag("US.gif");
				else if(vo.getCountry().equals("스페인")) vo.setMyFlag("ES.gif");
				else if(vo.getCountry().equals("프랑스")) vo.setMyFlag("FR.gif");
				else if(vo.getCountry().equals("일본")) vo.setMyFlag("JP.gif");
				else if(vo.getCountry().equals("독일")) vo.setMyFlag("DE.gif");
				else if(vo.getCountry().equals("중국")) vo.setMyFlag("CN.gif");
				else if(vo.getCountry().equals("러시아")) vo.setMyFlag("RU.gif");
				else  vo.setMyFlag("noFlag");
				
				if(vo.getNativeLanguage().equals("한국어")) vo.setMyLangFlag("KR.jpg");
				else if(vo.getNativeLanguage().equals("영어")) vo.setMyLangFlag("US.gif");
				else if(vo.getNativeLanguage().equals("스페인어")) vo.setMyLangFlag("ES.gif");
				else if(vo.getNativeLanguage().equals("프랑스어")) vo.setMyLangFlag("FR.gif");
				else if(vo.getNativeLanguage().equals("일본어")) vo.setMyLangFlag("JP.gif");
				else if(vo.getNativeLanguage().equals("독일어")) vo.setMyLangFlag("DE.gif");
				else if(vo.getNativeLanguage().equals("중국어")) vo.setMyLangFlag("CN.gif");
				else if(vo.getNativeLanguage().equals("러시아어")) vo.setMyLangFlag("RU.gif");
				else  vo.setMyLangFlag("noFlag");
				
				if(vo.getLearningLanguage().equals("한국어")) vo.setWantLangFlag("KR.jpg");
				else if(vo.getLearningLanguage().equals("영어")) vo.setWantLangFlag("US.gif");
				else if(vo.getLearningLanguage().equals("스페인어")) vo.setWantLangFlag("ES.gif");
				else if(vo.getLearningLanguage().equals("프랑스어")) vo.setWantLangFlag("FR.gif");
				else if(vo.getLearningLanguage().equals("일본어")) vo.setWantLangFlag("JP.gif");
				else if(vo.getLearningLanguage().equals("독일어")) vo.setWantLangFlag("DE.gif");
				else if(vo.getLearningLanguage().equals("중국어")) vo.setWantLangFlag("CN.gif");
				else if(vo.getLearningLanguage().equals("러시아어")) vo.setWantLangFlag("RU.gif");
				else vo.setWantLangFlag("noFlag");
				
				hideMemberList.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return hideMemberList;
	}

	
}

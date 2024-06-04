package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class ChatDAO {
	private Connection conn = GetConn.getConn();
	// private Connection conn2 = GetConn.getConn(); 이렇게 새로 생성해도 싱글톤으로 만들었기때문에 conn과 같은 객체이다 !
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	ChatVO vo = null;	
	
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

	
	
	// 메세지를 보냈던 사람들 가져오기
	public ArrayList<ChatVO> getChatMemberList(String mid, String searchStr) {
		ArrayList<ChatVO> vos = new ArrayList<ChatVO>();
		try {
			if(searchStr.equals("")) {
				sql = "select *, (select photo from member where mid=c.receiverMid) as photo from chat c where (senderMid = ? or receiverMid = ?) group by receiverMid order by chatDate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, mid);
			}
			else {
				sql = "select *, (select photo from member where mid=c.receiverMid) as photo from chat c where (senderMid = ? or receiverMid = ?) and receiverMid like ? group by receiverMid order by chatDate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, searchStr);
				pstmt.setString(3, "%"+searchStr+"%");
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ChatVO vo = new ChatVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setSenderMid(rs.getString("senderMid"));
				vo.setReceiverMid(rs.getString("receiverMid"));
				vo.setMessage(rs.getString("message"));
				vo.setChatDate(rs.getString("chatDate"));
				
				vo.setPhoto(rs.getString("photo"));
				
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
//메세지를 보냈던 사람들 가져오기
public ArrayList<ChatVO> getChatMemberList(String mid, String searchStr) {
   ArrayList<ChatVO> vos = new ArrayList<ChatVO>();
   try {
       if(searchStr.equals("")) {
           sql = "SELECT c.*, m.photo " +
                 "FROM chat c " +
                 "JOIN member m ON c.receiverMid = m.mid " +
                 "JOIN (SELECT receiverMid, MAX(chatDate) AS maxDate " +
                 "      FROM chat WHERE senderMid = ? " +
                 "      GROUP BY receiverMid) latest " +
                 "ON c.receiverMid = latest.receiverMid AND c.chatDate = latest.maxDate " +
                 "ORDER BY c.chatDate DESC";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, mid);
       }
       else {
           sql = "SELECT c.*, m.photo " +
                 "FROM chat c " +
                 "JOIN member m ON c.receiverMid = m.mid " +
                 "JOIN (SELECT receiverMid, MAX(chatDate) AS maxDate " +
                 "      FROM chat WHERE senderMid = ? " +
                 "      AND receiverMid LIKE ? " +
                 "      GROUP BY receiverMid) latest " +
                 "ON c.receiverMid = latest.receiverMid AND c.chatDate = latest.maxDate " +
                 "ORDER BY c.chatDate DESC";
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, mid);
           pstmt.setString(2, "%"+searchStr+"%");
       }
       rs = pstmt.executeQuery();
       
       while(rs.next()) {
           ChatVO vo = new ChatVO();
           vo.setIdx(rs.getInt("idx"));
           vo.setSenderMid(rs.getString("senderMid"));
           vo.setReceiverMid(rs.getString("receiverMid"));
           vo.setMessage(rs.getString("message"));
           vo.setChatDate(rs.getString("chatDate"));
           
           vo.setPhoto(rs.getString("photo"));
           
           vos.add(vo);
       }
   } catch (SQLException e) {
       System.out.println("SQL 오류 : " + e.getMessage());
   } finally {
       rsClose();
   }
   return vos;
}
*/
	
	
	
	// 메세지 내역 가져오기
	public ArrayList<ChatVO> getChatList(String mid, String receiverMid) {
		ArrayList<ChatVO> vos = new ArrayList<ChatVO>();
		try {
			sql = "select c.*, datediff(chatDate, now()) as date_diff, (select photo from member where mid=c.receiverMid) as photo from (select * from chat where (senderMid=? and receiverMid=?) or (receiverMid=? and senderMid=?) order by idx desc limit 50) c order by idx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, receiverMid);
			pstmt.setString(3, mid);
			pstmt.setString(4, receiverMid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ChatVO vo = new ChatVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setSenderMid(rs.getString("senderMid"));
				vo.setReceiverMid(rs.getString("receiverMid"));
				vo.setMessage(rs.getString("message"));
				vo.setChatDate(rs.getString("chatDate"));
				
				vo.setPhoto(rs.getString("photo"));
				vo.setDate_diff(rs.getInt("date_diff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	//채팅내용 DB에 저장하기
	public void setChatInputOk(String senderMid, String receiverMid, String message) {
		try {
			sql = "insert into chat values (default,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, senderMid);
			pstmt.setString(2, receiverMid);
			pstmt.setString(3, message);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// receiverMid의 사진 경로 받아오기
	public String getPhoto(String receiverMid) {
		String receiverPhoto = null;
		try {
			String sql = "select photo from member where mid = ?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, receiverMid);
	    rs = pstmt.executeQuery();
	
	    if (rs.next()) {
	      receiverPhoto = rs.getString("photo");
	    }
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return receiverPhoto;
	}

	
}

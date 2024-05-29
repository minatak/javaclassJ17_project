package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberDAO {
	private Connection conn = GetConn.getConn();
	// private Connection conn2 = GetConn.getConn(); 이렇게 새로 생성해도 싱글톤으로 만들었기때문에 conn과 같은 객체이다 !
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;	
	
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

	// 로그인시 아이디 체크하기
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getBirthday());
			pstmt.setString(8, vo.getPhoto());
			pstmt.setString(9, vo.getCountry());
			pstmt.setString(10, vo.getCity());
			pstmt.setString(11, vo.getNativeLanguage());
			pstmt.setString(12, vo.getLearningLanguage());
			pstmt.setString(13, vo.getLanguageLevel());
			pstmt.setString(14, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	

	// 닉네임 검색을 통한 자료의 수집 (중복 닉네임 체크 등)
	public MemberVO getMemberNickCheck(String nickName) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 회원 전체 리스트
	public ArrayList<MemberVO> getMemberList(int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select * from member where userDel = 'NO' order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
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

	//비밀번호 변경처리
	public int setMemberPwdChange(String mid, String pwd) {
		int res = 0;
		try {
			sql = "update member set pwd=? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	//회원 정보 수정처리 (아이디는 수정 불가능)
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "update member set nickName=?, name=?, email=?, gender=?, birthday=?, photo=?, country=?, "
					+ "city=?, nativeLanguage=?, learningLanguage=?, languageLevel=?, content=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getBirthday());
			pstmt.setString(6, vo.getPhoto());
			pstmt.setString(7, vo.getCountry());
			pstmt.setString(8, vo.getCity());
			pstmt.setString(9, vo.getNativeLanguage());
			pstmt.setString(10, vo.getLearningLanguage());
			pstmt.setString(11, vo.getLanguageLevel());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getMid());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	public int getTotRecCnt(String nativeLanguage) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt1 from member where nativeLanguage=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nativeLanguage);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt += rs.getInt("cnt1");
			rsClose();
			
			sql = "select count(*) as cnt2 from member where nativeLanguage != ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nativeLanguage);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt += rs.getInt("cnt2");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	// 회원 전체 리스트 - 본인의 '배우는 언어(learningLanguage)'가 '모국어(nativeLanguage)'인 사람들이 위쪽으로 뜨고, 그 이후에는 나머지가 뜨도록 처리. 
	public ArrayList<MemberVO> getMemberListLearningLanguage(String nativeLanguage, int startIndexNo, int pageSize) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select * from member where nativeLanguage=? union select * from member where nativeLanguage != ? and userDel = 'NO' limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nativeLanguage);
			pstmt.setString(2, nativeLanguage);
			pstmt.setInt(3, startIndexNo);
			pstmt.setInt(4, pageSize);
			rs = pstmt.executeQuery();
			
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

	public int getTotSearchRecCnt(String search, String select) {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from member where ?=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, select);
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
	
	// 회원 조건 검색으로 가져오기 
	public ArrayList<MemberVO> getMemberSearchList(String search, String select) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			sql = "select * from member where "+search+" = ? and userDel = 'NO' order by idx desc"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, select);
			rs = pstmt.executeQuery();
			
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
	
}

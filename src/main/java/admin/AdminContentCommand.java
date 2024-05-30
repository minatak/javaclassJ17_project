package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		int rCount = 0, mCount = 0, m99Count = 0;

		// 일주일 내 신고 회원 
		rCount = dao.getNewReportListCount();
		
		// 신규회원(mCount) : 오늘 날짜를 비교해 가입일(startDate)이 오늘보다 10일 이상 경과하지 않았을 경우 신규회원으로 한다. 
		mCount = dao.getNewMemberListCount();
		
		// 탈퇴 신청한 회원 (회원레벨이 99일경우 탈퇴신청한 회원임)
		m99Count = dao.getMemberDeleteCount();
		
		request.setAttribute("rCount", rCount); // 일주일 내 신고회원
		request.setAttribute("mCount", mCount); // 신규 등록회원
		request.setAttribute("m99Count", m99Count); // 탈퇴회원
	}

}

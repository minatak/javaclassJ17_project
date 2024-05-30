package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberDeleteCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 회원 탈퇴 신청 처리하기 (userDel필드를 'OK'로 변경처리)
		int res = dao.setMemberDeleteUpdate(mid);
		
		if(res != 0) {
			session.invalidate();
			request.setAttribute("message", "회원에서 탈퇴 되셨습니다.\\n한달간 같은 아이디로 재가입이 불가능합니다.");
			request.setAttribute("url", "Main.com");
		}
		else {
			request.setAttribute("message", "회원 탈퇴에 실패했습니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
	}
}

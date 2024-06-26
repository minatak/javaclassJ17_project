package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증 처리..
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		/*
		 * if(com.equals("/Register")) { viewPage += "/register.jsp"; }
		 */
		if(com.equals("/Register")) { // 회원가입 처리 
			viewPage += "/join/memberJoinStep1.jsp";
		}
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberNickCheck")) {
			command = new MemberNickCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberJoinOk1")) {
			command = new MemberJoinOk1Command();
			command.execute(request, response);
			viewPage += "/join/memberJoinStep2.jsp";
		}
		else if(com.equals("/MemberJoinOk2")) {
			command = new MemberJoinOk2Command();
			command.execute(request, response);
			viewPage += "/join/memberJoinStep3.jsp";
		}
		else if(com.equals("/Login")) { // 로그인 처리
			viewPage += "/login.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
		else if(level > 4) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/Login.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberSearchList")) {
			command = new MemberSearchListCommand();
			command.execute(request, response);
			viewPage += "/memberSearchList.jsp";
		}
		else if(com.equals("/MemberMain")) {  
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberUpdate")) {
			viewPage += "/update/memberUpdateMain.jsp";
		}
		else if(com.equals("/MemberPwdCheckAjax")) {
			command = new MemberPwdCheckAjaxCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberPwdChangeCheck")) {
			command = new MemberPwdChangeCheckCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberInfoUpdate")) {
			command = new MemberInfoUpdateCommand();
			command.execute(request, response);
			viewPage += "/update/memberInfoUpdate.jsp";
		}
		else if(com.equals("/MemberInfoUpdateOk")) {
			command = new MemberInfoUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberDeleteCheckOk")) {  
			command = new MemberDeleteCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberInfo")) { 
			command = new MemberInfoOkCommand();
			command.execute(request, response);
			viewPage += "/memberInfo.jsp";
		}
		else if(com.equals("/MemberProfile")) { // 쌤은 MemberSearch 라는 이름으로 한 부분.
			command = new MemberProfileCommand();
			command.execute(request, response);
			viewPage += "/memberProfile.jsp";
		}
		else if(com.equals("/RandomMember")) {  
			command = new RandomMemberCommand();
			command.execute(request, response);
			viewPage += "/randomMember.jsp";
		}
		
		
//		else if(com.equals("/MemberLoginOk")) {
//			command = new MemberLoginOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);  
		dispatcher.forward(request, response);		
	}
}

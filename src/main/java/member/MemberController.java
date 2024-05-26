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
		if(com.equals("/Register")) {
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
			/* return; */
			viewPage = "/include/message.jsp"; 
		}
		else if(com.equals("/MemberJoinStep2")) {
			viewPage += "/join/memberJoinStep2.jsp";
		}
		else if(com.equals("/MemberJoinOk2.mem")) {
			command = new MemberJoinOk2Command();
			command.execute(request, response);
			viewPage += "/join/memberJoinStep3.jsp";
		}
		else if(com.equals("/MemberJoinComplete")) {
			viewPage += "/join/memberJoinStep3.jsp";
		}
		else if(com.equals("/Login")) {
			viewPage += "/login.jsp";
		}
		else if(com.equals("/MemberMain")) {
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberInfo")) {
			viewPage += "/update/memberInfo.jsp";
		}
		else if(com.equals("/MemberUpdate")) {
			viewPage += "/update/memberUpdateMain.jsp";
		}
		else if(com.equals("/MemberPwdUpdate")) {
			viewPage += "/update/memberPwdUpdate.jsp";
		}
		else if(com.equals("/MemberInfoUpdate")) {
			viewPage += "/update/memberInfoUpdate.jsp";
		}
		else if(com.equals("/MemberList")) {
			viewPage += "/memberList.jsp";
		}
		else if(com.equals("/MemberProfile")) {
			viewPage += "/memberProfile.jsp";
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

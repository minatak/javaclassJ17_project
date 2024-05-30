package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증 처리
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		
		if(com.equals("/AdminMain")) {
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage += "/adminMain.jsp";
		}
		else if(com.equals("/AdminReports")) {
			command = new MemberReportListCommand();
			command.execute(request, response);
			viewPage += "/adminReports.jsp";
		}
		else if(com.equals("/MemberReportInput")) {
			command = new MemberReportInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberDeleteOk")) {
			command = new MemberDeleteOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberShowOk")) {
			command = new MemberShowOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberHideOk")) {
			command = new MemberHideOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/CancelReportOk")) {
			command = new CancelReportOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AdminMemberList")) {
			command = new AdminMemberListCommand();
			command.execute(request, response);
			viewPage += "/adminMemberList.jsp";
		}
//		else if(com.equals("/ReportCheck")) {
//			command = new ReportCheckCommand();
//			command.execute(request, response);
//			return;
//		}
		

		
//		else if(com.equals("/MemberLoginOk")) {
//			command = new MemberLoginOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);  
		dispatcher.forward(request, response);		
	}
}

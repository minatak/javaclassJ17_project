package chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.chat")
public class ChatController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChatInterface command = null;
		String viewPage = "/WEB-INF/chat";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증 처리
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		
//		if(com.equals("/ChatList")) {
//			viewPage += "/chatList.jsp";
//		}
		if(level > 4) {
			request.setAttribute("message", "로그인 후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/Login.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ChatMain")) {
			command = new ChatMainCommand();
			command.execute(request, response);
			viewPage += "/chatMain.jsp";
		}
		else if(com.equals("/ChatInput")) {
			command = new ChatInputCommand();
			command.execute(request, response);
			return;
		}
		
		
		
//		else if(com.equals("/MemberNickCheck")) {
//			command = new MemberNickCheckCommand();
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

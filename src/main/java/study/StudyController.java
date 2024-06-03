package study;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		// 인증 처리
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		
		if(com.equals("/VocaMain")) {
			command = new VocaMainCommand();
			command.execute(request, response);
			viewPage += "/vocaMain.jsp";
		}
		else if(com.equals("/VocaInput")) {
			viewPage += "/vocaInput.jsp";
		}
		else if(com.equals("/VocaInputOk")) {
			command = new VocaInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/VocaDetail")) {
			command = new VocaDetailCommand();
			command.execute(request, response);
			viewPage += "/vocaDetail.jsp";
		}
		else if(com.equals("/VocaEdit")) {
			//command = new VocaEditCommand();
			command.execute(request, response);
			viewPage += "/vocaEdit.jsp";
		}
		

//		else if(com.equals("/MemberNickCheck")) {
//			command = new MemberNickCheckCommand();
//			command.execute(request, response);
//			return;
//		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);  
		dispatcher.forward(request, response);		
	}
}

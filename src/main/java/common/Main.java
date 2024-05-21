package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.com")
public class Main extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		// 초기화면에 상품이미지(title image)를 랜덤하게 올려주기
		int mainImage = (int) (Math.random()*(115+1-5)) + 111;
		request.setAttribute("mainImage", mainImage);
		
		LoginDAO dao = new LoginDAO();
		
		ArrayList<LoginVO> recentVos = dao.getRecentFiveMember();
		
		request.setAttribute("recentVos", recentVos);
		
		String viewPage = "/main/main.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);;
		*/
		String viewPage = "/WEB-INF/main";
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"), com.lastIndexOf("."));
		
		if(com.equals("/Main")) {
			viewPage += "/main.jsp";
		}
		else if(com.equals("/About")) {
			viewPage += "/about.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}

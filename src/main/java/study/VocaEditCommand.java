package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VocaEditCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		
		VocaDAO dao = new VocaDAO();
		
	  ArrayList<VocaVO> vos = dao.getVocaDetail(mid, category);
	  
	  
	  request.setAttribute("vos", vos);
	  request.setAttribute("category", category);
	}
}

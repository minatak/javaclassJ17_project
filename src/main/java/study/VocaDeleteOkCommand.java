package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;

public class VocaDeleteOkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		
		VocaDAO dao = new VocaDAO();

		int res = 0;
		if(!category.equals("")) {
			res = dao.setVocaDeleteOk(category, mid);
		}
		else {			
			String[] selectVocaArray = request.getParameter("selectVocaArray").split("/");
			for(int i=0; i<selectVocaArray.length; i++) {
				res = dao.setVocaDeleteOk(selectVocaArray[i], mid);
			}
		}
		
		response.getWriter().write(res);
	}

}

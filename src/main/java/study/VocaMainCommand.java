package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VocaMainCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String memberMid = request.getParameter("memberMid")== null ? "" : request.getParameter("memberMid");
		VocaDAO dao = new VocaDAO();
		
		if(!memberMid.equals("")) {
			ArrayList<VocaVO> vos = dao.getMemberVocaList(memberMid);
			request.setAttribute("vos", vos);
			request.setAttribute("memberMid", memberMid);
		}
		else {
			ArrayList<VocaVO> vos = dao.getVocaList(mid);
			request.setAttribute("vos", vos);
		}
		
	}

}

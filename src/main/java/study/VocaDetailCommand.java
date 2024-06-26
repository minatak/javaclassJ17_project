package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VocaDetailCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		String memberMid = request.getParameter("memberMid")== null ? "" : request.getParameter("memberMid");
		
		VocaDAO dao = new VocaDAO();
		ArrayList<VocaVO> vos = new ArrayList<VocaVO>();
		if(!memberMid.equals("")) {
			vos = dao.getVocaDetail(memberMid, category);
		}
		else {
			vos = dao.getVocaDetail(mid, category);
		}
	  
	  // System.out.println("vos : " + vos);
	  request.setAttribute("vos", vos);
	  request.setAttribute("category", category);
	  request.setAttribute("memberMid", memberMid);
		
	}

}

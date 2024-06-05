package study;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VocaTestCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String category = request.getParameter("category") == null ? "" : request.getParameter("category");
		String wordMid = request.getParameter("wordMid") == null ? "" : request.getParameter("wordMid");
		
		VocaDAO dao = new VocaDAO();
		
//		System.out.println("wordMid : " + wordMid);
//		System.out.println("category : " + category);
		
		ArrayList<VocaVO> vos = dao.getVocaDetail(wordMid, category); 
		
//		System.out.println(vos);
		
		Collections.shuffle(vos);
		int questionCount = Math.min(10, vos.size()); // 최대 10문제
//		System.out.println("questionCount : " + questionCount);
		
		request.setAttribute("vos", vos);
		request.setAttribute("questionCount", questionCount);
	}	
}

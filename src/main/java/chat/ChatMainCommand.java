package chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChatMainCommand implements ChatInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		String receiverMid = request.getParameter("receiverMid")== null ? "" : request.getParameter("receiverMid");
		String searchStr = request.getParameter("searchStr")== null ? "" : request.getParameter("searchStr");
		
//		System.out.println("searchStr : " + searchStr);
		
		ChatDAO dao = new ChatDAO();
		ArrayList<ChatVO> vos = null;
		TreeSet<String> midVos = null;
		if(searchStr.equals("")) {
			vos = dao.getChatMemberList(mid, searchStr);
			midVos = new TreeSet<String>();
			for(ChatVO vo : vos) {
				midVos.add(vo.getSenderMid() + "/" + vo.getPhoto());
				midVos.add(vo.getReceiverMid() + "/" + vo.getPhoto());
			}
		}
		else vos = dao.getChatMemberList(mid, searchStr);
		
		
		
		// receiverMid의 사진 경로 받아오기 
		String receiverPhoto = dao.getPhoto(receiverMid);
		
		request.setAttribute("vos", vos);
		request.setAttribute("midVos", midVos);
		session.setAttribute("sReceiverMid", receiverMid);
		session.setAttribute("sReceiverPhoto", receiverPhoto);
		
	}

}

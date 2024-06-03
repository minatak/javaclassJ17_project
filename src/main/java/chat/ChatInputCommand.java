package chat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatInputCommand implements ChatInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String senderMid = request.getParameter("senderMid")==null ? "" : request.getParameter("senderMid");
		String receiverMid = request.getParameter("receiverMid")==null ? "" : request.getParameter("receiverMid");
		String message = request.getParameter("message")==null ? "" : request.getParameter("message");
		
		message = message.replace("<", "&lt;").replace(">", "&gt;");
		
		ChatDAO dao = new ChatDAO();
		
		dao.setChatInputOk(senderMid, receiverMid, message);
	}

}

package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberHideOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();

		String[] selectMemberArray = request.getParameter("selectMemberArray").split("/");
		
		int res = 0;
		for(int i=0; i<selectMemberArray.length; i++) {
			res = dao.MemberHideOk(selectMemberArray[i]);
		}
		
		response.getWriter().write(res);
	}

}

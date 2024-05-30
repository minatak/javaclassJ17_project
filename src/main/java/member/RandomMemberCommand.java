package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RandomMemberCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> vos = dao.getMemberList();
		MemberVO vo = null;
		int randIdx = 0;
		
		while(true) {			
			randIdx = (int) (Math.random() * vos.size());
			
			vo = dao.getMemberIdxCheck(randIdx);
			
			if(vo.getMid() != null) break;
		}

		// System.out.println(vo);
		
		request.setAttribute("vo", vo);
	}
}

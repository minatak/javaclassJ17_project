package member;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberProfileCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 만 나이 구하기
	  int birthYear = Integer.parseInt(vo.getBirthday().substring(0, 4));
	  int birthMonth = Integer.parseInt(vo.getBirthday().substring(5, 7));
	  int birthDay = Integer.parseInt(vo.getBirthday().substring(8, 10));
	  
    Calendar current = Calendar.getInstance();
   
    int currentYear  = current.get(Calendar.YEAR);
    int currentMonth = current.get(Calendar.MONTH) + 1;
    int currentDay   = current.get(Calendar.DAY_OF_MONTH);
    
    // 만 나이 구하기 (현재년-태어난년)
    int age = currentYear - birthYear;
    // 만약 생일이 지나지 않았으면 -1
    if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) age = age - 1;
    // 두 수를 비교 했을 때 생일이 더 클 경우 생일이 지나지 않은 것이다.
	  
		request.setAttribute("vo", vo);
		request.setAttribute("age", age);
	}
}

package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinOk2Command implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String gender = request.getParameter("gender")==null? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null? "" : request.getParameter("birthday");
		String photo = request.getParameter("photo")==null? "" : request.getParameter("photo");
		String country = request.getParameter("country")==null? "" : request.getParameter("country");
		String city = request.getParameter("city")==null? "" : request.getParameter("city");
		String nativeLanguage = request.getParameter("nativeLanguage")==null? "" : request.getParameter("nativeLanguage");
		String learningLanguage = request.getParameter("learningLanguage")==null? "" : request.getParameter("learningLanguage");
		String languageLevel = request.getParameter("languageLevel")==null? "" : request.getParameter("languageLevel");
		String content = request.getParameter("content")==null? "" : request.getParameter("content");
		
		// DB에 저장시킨자료중 not null 데이터는 Back End 체크시켜준다.
		
		
		// 모든 체크가 끝난 자료는 vo에 담아서 DB에 저장처리한다.
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setEmail(email);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setPhoto(photo);
		vo.setCountry(country);
		vo.setCity(city);
		vo.setNativeLanguage(nativeLanguage);
		vo.setLearningLanguage(learningLanguage);
		vo.setLanguageLevel(languageLevel);
		vo.setContent(content);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res != 0) {
			/*
			 * request.setAttribute("message", "회원 가입되셨습니다.\\n다시 로그인해 주세요.");
			 * request.setAttribute("url", "MemberLogin.mem");
			 */
			request.getRequestDispatcher("MemberJoinComplete.mem").forward(request, response);
		}
		else System.out.println("MemberJoinOk2Command 오류..? 회원가입 실패.");
		

	}

}

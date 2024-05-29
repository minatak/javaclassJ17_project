package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberInfoUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String gender = request.getParameter("gender")==null? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null? "" : request.getParameter("birthday");
		String photo = request.getParameter("fName")=="" ? "noimage.png" : request.getParameter("fName");
		String country = request.getParameter("country")==null? "" : request.getParameter("country");
		String city = request.getParameter("city")==null? "" : request.getParameter("city");
		String nativeLanguage = request.getParameter("nativeLanguage")==null? "" : request.getParameter("nativeLanguage");
		String learningLanguage = request.getParameter("learningLanguage")==null? "" : request.getParameter("learningLanguage");
		String languageLevel = request.getParameter("languageLevel")==null? "" : request.getParameter("languageLevel");
		String content = request.getParameter("content")==null? "" : request.getParameter("content");
		
		// 닉네임 중복체크....
		HttpSession session = request.getSession();
		String sNickName = (String) session.getAttribute("sNickName");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberNickCheck(nickName);
		
		// 세션의 닉네임과 앞에서 넘어온 닉네임을 비교해서 같지 않으면 사용자가 닉네임을 수정한 것이다.
		if(!nickName.equals(sNickName)) {
			if(vo.getNickName() != null) {
				request.setAttribute("message", "이미 사용중인 닉네임 입니다.");
				request.setAttribute("url", "MemberInfoUpdate.mem");
				return;
			}
		}
		
		System.out.println("nickName : " + nickName);
		System.out.println("name : " + name);
		
		// 모든 체크가 끝난 자료는 vo에 담아서 DB에 저장처리한다.
		vo = new MemberVO();
		vo.setMid(mid);
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
		
		int res = dao.setMemberUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("sNickName", vo.getNickName());
			request.setAttribute("message", "회원 정보가 수정되었습니다.");
			request.setAttribute("url", "MemberMain.mem");
		}
		else {
			request.setAttribute("message", "회원정보 수정에 실패했습니다.");
			request.setAttribute("url", "MemberUpdate.mem");
		}
	}
}

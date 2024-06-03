package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberJoinOk2Command implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member");
		int maxSize = 1024 * 1024 * 5;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String mid = multipartRequest.getParameter("mid")==null? "" : multipartRequest.getParameter("mid");
		String pwd = multipartRequest.getParameter("pwd")==null? "" : multipartRequest.getParameter("pwd");
		String nickName = multipartRequest.getParameter("nickName")==null? "" : multipartRequest.getParameter("nickName");
		String name = multipartRequest.getParameter("name")==null? "" : multipartRequest.getParameter("name");
		String email = multipartRequest.getParameter("email")==null? "" : multipartRequest.getParameter("email");
		String gender = multipartRequest.getParameter("gender")==null? "" : multipartRequest.getParameter("gender");
		String birthday = multipartRequest.getParameter("birthday")==null? "" : multipartRequest.getParameter("birthday");
		String photo = multipartRequest.getFilesystemName("fName")== "" ? "noimage.png" : multipartRequest.getFilesystemName("fName");
		String country = multipartRequest.getParameter("country")==null? "" : multipartRequest.getParameter("country");
		String city = multipartRequest.getParameter("city")==null? "" : multipartRequest.getParameter("city");
		String nativeLanguage = multipartRequest.getParameter("nativeLanguage")==null? "" : multipartRequest.getParameter("nativeLanguage");
		String learningLanguage = multipartRequest.getParameter("learningLanguage")==null? "" : multipartRequest.getParameter("learningLanguage");
		String languageLevel = multipartRequest.getParameter("languageLevel")==null? "" : multipartRequest.getParameter("languageLevel");
		String content = multipartRequest.getParameter("content")==null? "" : multipartRequest.getParameter("content");
		
//		System.out.println("photo : " + photo);
		
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
		
		dao.setMemberJoinOk(vo);
		
		request.setAttribute("vo", vo);
		//int res = dao.setMemberJoinOk(vo);
		
		//if(res != 0) {
			/*
			 * request.setAttribute("message", "회원 가입되셨습니다.\\n다시 로그인해 주세요.");
			 * request.setAttribute("url", "MemberLogin.mem");
			 */
			//request.getRequestDispatcher("MemberJoinComplete.mem").forward(request, response);
		//}
		//else System.out.println("MemberJoinOk2Command 오류 - 회원가입 실패.");
		

	}

}

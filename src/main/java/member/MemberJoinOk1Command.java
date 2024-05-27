package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberJoinOk1Command implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null? "" : request.getParameter("name");
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		String gender = request.getParameter("gender")==null? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null? "" : request.getParameter("birthday");
	
//		String photo = request.getParameter("photo")==null? "" : request.getParameter("photo");
//		String country = request.getParameter("country")==null? "" : request.getParameter("country");
//		String city = request.getParameter("city")==null? "" : request.getParameter("city");
//		String nativeLanguage = request.getParameter("nativeLanguage")==null? "" : request.getParameter("nativeLanguage");
//		String learningLanguage = request.getParameter("learningLanguage")==null? "" : request.getParameter("learningLanguage");
//		String languageLevel = request.getParameter("languageLevel")==null? "" : request.getParameter("languageLevel");
//		String content = request.getParameter("content")==null? "" : request.getParameter("content");
		
		// 비밀번호 암호화(sha256) - salt키를 만든후 암호화 시켜준다.(uuid코드중 앞자리 8자리 같이 병행처리후 암호화시킨다.)
		// uuid를 통한 salt키 만들기(앞에서 8자리를 가져왔다.)
		String salt = UUID.randomUUID().toString().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		pwd = salt + pwd;
		
		// 모든 체크가 끝난 자료는 vo에 담아서 step2에 넘겨준다.
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setEmail(email);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
//		vo.setBirthday(birthday);
		
		
		
		
		request.setAttribute("vo", vo);
		
		
		
//		request.setAttribute("message", "NO");
//		request.setAttribute("url", "MemberJoinStep2.mem");

	//	request.getRequestDispatcher("MemberJoinStep2.mem").forward(request, response);
	  
		
	}
}

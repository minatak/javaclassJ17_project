package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberInfoUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member");
		int maxSize = 1024 * 1024 * 5;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String mid = multipartRequest.getParameter("mid")==null? "" : multipartRequest.getParameter("mid");
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
		
		// 닉네임 중복체크 
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

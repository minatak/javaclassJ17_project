package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberVO;

public class VocaInputOkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String category = request.getParameter("category") == null ? "" : request.getParameter("category");
     String wordsStr = request.getParameter("wordsStr") == null ? "" : request.getParameter("wordsStr");
     String meaningsStr = request.getParameter("meaningsStr") == null ? "" : request.getParameter("meaningsStr");
     String memberMid = request.getParameter("mid") == null ? "" : request.getParameter("mid");

     System.out.println("category : " + category);
     System.out.println("wordsStr : " + wordsStr);
     System.out.println("meaningsStr : " + meaningsStr);
     System.out.println("memberMid : " + memberMid);

     if (wordsStr.isEmpty() || meaningsStr.isEmpty()) {
       request.setAttribute("message", "단어와 뜻을 입력해주세요.");
       request.setAttribute("url", "VocaInput.st");
       return;
     }

     String[] words = wordsStr.split("/");
     String[] posNmeanings = meaningsStr.split("/");

     if (words.length != posNmeanings.length) {
       request.setAttribute("message", "단어와 뜻의 수가 일치하지 않습니다.");
       request.setAttribute("url", "VocaInput.st");
       return;
     }

     String[] meanings = new String[posNmeanings.length];
     String[] partOfSpeech = new String[posNmeanings.length];

     for (int i = 0; i < posNmeanings.length; i++) {
       String[] parts = posNmeanings[i].split("\\)");
       if (parts.length == 2) {
         partOfSpeech[i] = turnPartOfSpeech(parts[0].trim());
         meanings[i] = parts[1].trim();
       } else {
         partOfSpeech[i] = "";
         meanings[i] = posNmeanings[i].trim();
       }
     }

    // 값 확인
    for (int i = 0; i < words.length; i++) {
      System.out.println((i+1) + ". 단어: " + words[i] + ", 뜻: " + meanings[i] + ", 품사: " + partOfSpeech[i]);
    }

    VocaDAO dao = new VocaDAO();
    int res = 0;

    for (int i = 0; i < words.length; i++) {
      VocaVO vo = new VocaVO();
      vo.setCategory(category);
      vo.setWord(words[i]);
      vo.setMeaning(meanings[i]);
      vo.setPartOfSpeech(partOfSpeech[i]);
      vo.setMemberMid(memberMid);

      res += dao.setVocaInputOk(vo);
    }

    if (res == words.length) {
      request.setAttribute("message", "단어장이 등록되었습니다 :)");
      request.setAttribute("url", "MemberMain.mem");
    } else {
      request.setAttribute("message", "단어장 등록에 실패했습니다.");
      request.setAttribute("url", "MemberUpdate.mem");
    }
	}
	
	private String turnPartOfSpeech(String partOfSpeech) { // 품사 일정하게 바꾸기
  	if (partOfSpeech.equalsIgnoreCase("v") || 
      partOfSpeech.equals("동사") || 
      partOfSpeech.equalsIgnoreCase("verb") || 
      partOfSpeech.equals("동")) {
    		return "동사";
    } else if (partOfSpeech.equalsIgnoreCase("n") || 
		  partOfSpeech.equals("명사") || 
		  partOfSpeech.equalsIgnoreCase("noun") || 
		  partOfSpeech.equals("명")) {
    		return "명사";
    } else if (partOfSpeech.equalsIgnoreCase("phr") || 
  		partOfSpeech.equals("구")) {
        return "구";
    } else if (partOfSpeech.equalsIgnoreCase("adj") || 
      partOfSpeech.equals("형용사") || 
      partOfSpeech.equals("형")) {
      	return "형용사";
    } else if (partOfSpeech.equalsIgnoreCase("adv") || 
	    partOfSpeech.equals("부사") || 
	    partOfSpeech.equalsIgnoreCase("adverb") || 
	    partOfSpeech.equals("부")) {
        return "부사";
    } else if (partOfSpeech.equalsIgnoreCase("pron") || 
      partOfSpeech.equals("대명사") || 
      partOfSpeech.equalsIgnoreCase("pronoun") || 
      partOfSpeech.equals("대")) {
        return "대명사";
    } else if (partOfSpeech.equalsIgnoreCase("prep") || 
  		partOfSpeech.equals("전치사") || 
  		partOfSpeech.equalsIgnoreCase("preposition") || 
  		partOfSpeech.equals("전")) {
        return "전치사";
    } else if (partOfSpeech.equalsIgnoreCase("conj") || 
  		 partOfSpeech.equals("접속사") || 
       partOfSpeech.equalsIgnoreCase("conjunction") || 
       partOfSpeech.equals("접")) {
        return "접속사";
    } else if (partOfSpeech.equalsIgnoreCase("interj") || 
    	 partOfSpeech.equals("감탄사") || 
       partOfSpeech.equalsIgnoreCase("interjection") || 
       partOfSpeech.equals("감")) {
        return "감탄사";
    } else {
        return partOfSpeech;  
    }
	}
}

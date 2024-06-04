package study;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VocaEditOkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category") == null ? "" : request.getParameter("category");
    String wordsStr = request.getParameter("wordsStr") == null ? "" : request.getParameter("wordsStr");
    String meaningsStr = request.getParameter("meaningsStr") == null ? "" : request.getParameter("meaningsStr");
    String[] idxStr = request.getParameterValues("idx");

    if (wordsStr.isEmpty() || meaningsStr.isEmpty()) {
      request.setAttribute("message", "단어와 뜻을 입력해주세요.");
      request.setAttribute("url", "VocaEdit.st?category=" + category);
      return;
    }

    String[] words = wordsStr.split("/");
    String[] posNmeanings = meaningsStr.split("/");

    if (words.length != posNmeanings.length) {
      request.setAttribute("message", "단어와 뜻의 수가 일치하지 않습니다.");
      request.setAttribute("url", "VocaEdit.st?category=" + category);
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

    int res = 0;
    VocaDAO dao = new VocaDAO();

    for (int i = 0; i < words.length; i++) {
      VocaVO vo = new VocaVO();
      vo.setCategory(category);
      vo.setWord(words[i]);
      vo.setMeaning(meanings[i]);
      vo.setPartOfSpeech(partOfSpeech[i]);

      int idx = Integer.parseInt(idxStr[i]);
      res += dao.setVocaEditOk(vo, idx);
    }

    if (res == words.length) {
      request.setAttribute("message", "단어장이 수정되었습니다 :)");
      request.setAttribute("url", "VocaDetail.st?category=" + category);
    } else {
      request.setAttribute("message", "단어장 수정에 실패했습니다.");
      request.setAttribute("url", "VocaEdit.st?category=" + category);
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
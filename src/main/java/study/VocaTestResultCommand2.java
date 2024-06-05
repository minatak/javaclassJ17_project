package study;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VocaTestResultCommand2 implements StudyInterface {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // "," 로 쓴 뜻까지 다 입력해야 정답으로 뜸
  	
  	HttpSession session = request.getSession();
    String memberMid = (String) session.getAttribute("sMid");
    String category = request.getParameter("category");
    String wordMid = request.getParameter("wordMid");

    String[] words = request.getParameterValues("words");
    String[] correctMeanings = request.getParameterValues("correctMeaning");
    String[] userAnswers = request.getParameterValues("userAnswer");

    List<VocaTestVO> vos = new ArrayList<>();
    int correctCount = 0;

    for (int i = 0; i < words.length; i++) {
      boolean correct = userAnswers[i].equalsIgnoreCase(correctMeanings[i]);
      if (correct) {
        correctCount++;
      }
      vos.add(new VocaTestVO(words[i], correctMeanings[i], userAnswers[i], correct));
    }

    // 점수를 반올림하여 정수로 계산
    int score = Math.round((float) correctCount * 100 / words.length);

    VocaTestDAO dao = new VocaTestDAO();
    dao.setTestResult(memberMid, category, score); // 데이터베이스에 시험 결과 저장

    request.setAttribute("wordMid", wordMid);
    request.setAttribute("category", category);
    request.setAttribute("score", score);
    request.setAttribute("correctCount", correctCount);
    request.setAttribute("questionCnt", words.length);
    request.setAttribute("vos", vos);
  }
}

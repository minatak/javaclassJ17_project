package study;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VocaTestResultCommand implements StudyInterface {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    String memberMid = (String) session.getAttribute("sMid");
    String category = request.getParameter("category");
    String wordMid = request.getParameter("wordMid");

    System.out.println("category : " + category);

    String[] words = request.getParameterValues("words");
    String[] correctMeanings = request.getParameterValues("correctMeaning");
    String[] userAnswers = request.getParameterValues("userAnswer");

    int correctCount = 0;

    for (int i = 0; i < words.length; i++) {
      if (correctMeanings[i].equalsIgnoreCase(userAnswers[i])) {
        correctCount++;
      }
    }

    // 점수를 반올림하여 정수로 계산
    int score = Math.round((float) correctCount * 100 / words.length);

    VocaTestDAO dao = new VocaTestDAO();
    dao.setTestResult(memberMid, category, score);

    request.setAttribute("wordMid", wordMid);
    request.setAttribute("category", category);
    request.setAttribute("score", score);
    request.setAttribute("questionCnt", words.length);
  }
}

package study;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VocaTestResultCommand implements StudyInterface {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  // "," 로 쓴 뜻 중 하나만 입력해도 정답 처리
		
		HttpSession session = request.getSession();
	  String memberMid = (String) session.getAttribute("sMid");
	  String category = request.getParameter("category");
	  String wordMid = request.getParameter("wordMid");
	
	  String[] words = request.getParameterValues("words");
	  String[] correctMeanings = request.getParameterValues("correctMeaning");
	  String[] userAnswers = request.getParameterValues("userAnswer");
	
	  List<VocaTestVO> vos = new ArrayList<>();
	  int correctCount = 0;
	
	  /*
	  for (int i = 0; i < words.length; i++) {
	    // 현재 단어, 정답 의미, 사용자 답변을 배열에서 가져옴
	    String word = words[i];
	    String correctAnswer = correctMeanings[i];
	    String userAnswer = userAnswers[i];
	    // correctAnswer 문자열을 쉼표(,) 기준으로 나눈 후 각 문자열의 공백을 제거하고
	    // 나눠진 문자열 중 하나라도 userAnswer와 대소문자 구분 없이 일치하는지 확인
	    boolean correct = Arrays.stream(correctAnswer.split(",")) // correctAnswer 문자열을 쉼표 기준으로 나누고 분할된 문자열을 스트림으로 변환
	      .map(String::trim) // 각 문자열의 앞뒤 공백 제거
	      .anyMatch(answer -> answer.equalsIgnoreCase(userAnswer.trim())); // 트림된 userAnswer와 대소문자 구분 없이 비교, 일치하는 문자열이 있으면 true 반환
	
	    if (correct) { // 일치하는 답변이 있으면 정답 개수 +1
	      correctCount++;
	    }
	    // 현재 단어에 대한 테스트 결과를 vos 리스트에 추가
	    vos.add(new VocaTestVO(word, correctAnswer, userAnswer, correct));
	  }
	  */
	
		for (int i = 0; i < words.length; i++) {
		  String word = words[i];
		  String correctAnswer = correctMeanings[i];
		  String userAnswer = userAnswers[i];
		
		  // 정답과 사용자 답변을 쉼표로 나누고 각 부분의 공백을 제거합니다.
		  Set<String> correctAnswerSet = new HashSet<>(Arrays.asList(correctAnswer.split("\\s*,\\s*")));
		  Set<String> userAnswerSet = new HashSet<>(Arrays.asList(userAnswer.split("\\s*,\\s*")));
		
		  // 모든 사용자 답변이 정답에 존재하는지 확인함
		  boolean correct = userAnswerSet.stream()
		  	.allMatch(answer -> correctAnswerSet.contains(answer.trim().toLowerCase()));
		
		  if (correct) {
		    correctCount++;
		  }
		
		  vos.add(new VocaTestVO(word, correctAnswer, userAnswer, correct));
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

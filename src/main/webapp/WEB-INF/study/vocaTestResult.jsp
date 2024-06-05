<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>단어 테스트 결과</title>
  <%@ include file="/include/bs4.jsp" %>
  <style>
  
    @font-face {
        font-family: 'NEXON Lv1 Gothic OTF';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    @font-face {
        font-family: 'CWDangamAsac-Bold';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    body {
        font-family: 'NEXON Lv1 Gothic OTF';
        background-color: #fefefe;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 0 auto;
        padding: 20px;
        font-family: 'NEXON Lv1 Gothic OTF';
        color: #5e503f;
    }
    h1, h2 {
        font-family: 'CWDangamAsac-Bold';
        color: #35ae5f; 
        text-align: center;
    }
    .score, .correct-words {
        text-align: center;
    }
    .correct-words {
        font-size: 20px;
    }
    .score {
        font-size: 24px;
        color: #8B4513;  
        font-weight: bold;
    }
    .admin-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 40px;
        color: #5e503f;
    }
    .admin-table th, .admin-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
        font-family: 'NEXON Lv1 Gothic OTF';
    }
    .admin-table th {
        background-color: #fdfad1;
        color: #5e503f;
    }
    .admin-table .incorrect {
        color: red;
    }
    .btn {
        display: block;
        width: 200px;
        margin: 30px auto;
        padding: 10px 20px;
        background-color: #35ae5f;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
        transition: background-color 0.3s ease;
    }
    .btn:hover {
        background-color: #2d8e51;
    }
  </style>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
   <p><br/></p>
  <div class="container mt-4">
    <h1>단어 테스트 결과</h1>
    <p class="correct-words m-2">맞힌 단어 수: <fmt:formatNumber value="${correctCount}" type="number" minFractionDigits="0" maxFractionDigits="0" /> / ${questionCnt}</p>
    <p class="score mt-3 mb-4">점수: ${score}점</p>
    <table class="table table-striped table-hover mt-3 admin-table">
      <thead class="table-dark">
        <tr>
          <th style="width:75px; vertical-align: middle;">번호</th>
          <th style="vertical-align: middle;">단어</th>
          <th style="vertical-align: middle;">정답</th>
          <th style="vertical-align: middle;">제출한 답</th>
          <th style="vertical-align: middle;">정답 여부</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="vo" items="${vos}" varStatus="st">
          <tr class="${vo.correct ? '' : 'incorrect'}">
            <td>${st.index + 1}</td>
            <td>${vo.word}</td>
            <td>${vo.correctMeaning}</td>
            <td>${vo.userAnswer}</td>
            <td>${vo.correct ? 'O' : 'X'}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <a href="VocaTest.st?category=${category}&wordMid=${wordMid}" class="btn">다시 테스트하기</a>
  </div>
  <p><br/></p>
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

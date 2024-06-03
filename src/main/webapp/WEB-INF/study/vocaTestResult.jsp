<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>

<%
    class WordResult { // 이부분을 command로 빼면 됨 !!
        String word;
        String correctMeaning;
        String userAnswer;
        boolean isCorrect;
    }

    List<WordResult> results = new ArrayList<>();
    int score = 0;

    for (int i = 0; i < request.getParameterValues("words.length"); i++) {
        WordResult result = new WordResult();
        result.word = request.getParameterValues("words[" + i + "].word")[0];
        result.correctMeaning = request.getParameterValues("words[" + i + "].correctMeaning")[0];
        result.userAnswer = request.getParameterValues("words[" + i + "].userAnswer")[0];
        result.isCorrect = result.correctMeaning.equalsIgnoreCase(result.userAnswer);
        if (result.isCorrect) {
            score++;
        }
        results.add(result);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 테스트 결과</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
            background-color: #f3f4f6;
            font-size: 16px;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .result {
            margin-bottom: 20px;
        }
        .result h3 {
            font-family: 'CWDangamAsac-Bold', sans-serif;
            color: #36b574;
        }
        .correct {
            color: #28a745;
        }
        .incorrect {
            color: #dc3545;
        }
        .btn {
            padding: 10px 15px;
            background-color: #35ae5f;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #379866;
        }
    </style>
</head>
<body>
    <main class="container">
        <h1>테스트 결과</h1>
        <h2>점수: <c:out value="${score}"/> / <c:out value="${results.size()}"/></h2>
        <c:forEach var="result" items="${results}">
            <div class="result">
                <h3>${result.word}</h3>
                <p>
                    당신의 답: <span class="${result.isCorrect ? 'correct' : 'incorrect'}">
                    ${result.userAnswer}</span>
                </p>
                <c:if test="${!result.isCorrect}">
                    <p>정답: <span class="correct">${result.correctMeaning}</span></p>
                </c:if>
            </div>
        </c:forEach>
        <a href="${ctp}/" class="btn">다시 테스트 하기</a>
    </main>
</body>
</html>

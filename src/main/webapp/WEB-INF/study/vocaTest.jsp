<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List, java.util.Collections, java.util.ArrayList" %>

<%
    // 샘플 단어 목록 (이 부분은 실제 데이터베이스에서 가져오도록 수정해야 합니다)
    List<Word> words = (List<Word>) session.getAttribute("vos");
    Collections.shuffle(words);
    int questionCount = Math.min(10, words.size()); // 최대 10문제
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 테스트</title>
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
        .question {
            margin-bottom: 20px;
        }
        .question h3 {
            font-family: 'CWDangamAsac-Bold', sans-serif;
            color: #36b574;
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
        <h1>단어 테스트</h1>
        <form action="vocabTestResult.jsp" method="POST">
            <c:forEach var="word" items="${words}" varStatus="status" begin="0" end="${questionCount-1}">
                <div class="question">
                    <h3>Q${status.index + 1}. ${word.word}</h3>
                    <input type="hidden" name="words[${status.index}].word" value="${word.word}" />
                    <input type="hidden" name="words[${status.index}].correctMeaning" value="${word.meaning}" />
                    <input type="text" name="words[${status.index}].userAnswer" class="form-control" />
                </div>
            </c:forEach>
            <button type="submit" class="btn">제출</button>
        </form>
    </main>
</body>
</html>

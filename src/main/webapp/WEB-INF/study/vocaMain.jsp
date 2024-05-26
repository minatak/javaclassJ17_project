<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 인풋 페이지</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="css/styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'NEXON Lv1 Gothic OTF';
            background-color: #f3f4f6;
            font-size: 14px;
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }
        h1 {
            font-family: 'CWDangamAsac-Bold';
            color: #35ae5f;
        }
        .card {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fefefe;
        }
        .card h3 {
            font-family: 'CWDangamAsac-Bold';
            color: #36b574;
            margin-bottom: 20px;
        }
        .word-list li {
            margin-bottom: 10px;
            color: #6f5340;
        }
        .btn {
            padding: 10px 15px;
            background-color: #35ae5f;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #379866;
        }
    </style>
 </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
    <div class="dashboard-header">
        <h1>단어 암기 메인 페이지</h1>
    </div>

    <div class="card">
        <h3>새 단어장 만들기</h3>
        <form action="VocaInput.st" method="GET">
            <button class="btn" type="submit">단어장 만들기</button>
        </form>
    </div>

    <div class="card">
        <h3>기존 단어장</h3>
        <ul class="word-list">
            <!-- 예시: 기존 단어장을 리스트로 보여줌 -->
            <li>
                단어장 1
                <a class="btn" href="VocaDetail.st">보기</a>
                <a class="btn" href="VocaEdit.st">수정</a>
                <a class="btn" href="VocaDelete.st">삭제</a>
            </li>
            <li>
                단어장 2
                <a class="btn" href="vocabDetail.jsp?id=2">보기</a>
                <a class="btn" href="vocabEdit.jsp?id=2">수정</a>
                <a class="btn" href="deleteVocab.do?id=2">삭제</a>
            </li>
            <!-- 더 많은 단어장 리스트 -->
        </ul>
    </div>
 </main>
    <!-- Footer-->
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
</html>



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
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #6f5340;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
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
        <h1>단어 인풋 페이지</h1>
    </div>

    <div class="card">
        <form action="saveVocab.do" method="POST">
            <div class="input-group">
                <label>단어장 이름(카테고리):</label>
                <input type="text" name="vocabName" required>
            </div>
            <div class="input-group">
                <label>단어:</label>
                <input type="text" name="word" required>
            </div>
            <div class="input-group">
                <label>뜻:</label>
                <input type="text" name="meaning" required>
            </div>
            <div class="input-group">
                <label>품사:</label>
                <input type="text" name="partOfSpeech">
            </div>
            <div class="input-group">
                <label>예문:</label>
                <input type="text" name="example">
            </div>
            <button class="btn" type="submit">저장</button>
        </form>
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

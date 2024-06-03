<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 암기 상세 페이지</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <style>
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src: url('${ctp}/fonts/NEXONLv1GothicOTF-Regular.otf') format('opentype');
        }
        @font-face {
            font-family: 'CWDangamAsac-Bold';
            src: url('${ctp}/fonts/CWDangamAsac-Bold.ttf') format('truetype');
        }
        body {
            font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
            background-color: #f3f4f6;
            font-size: 16px;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
        }
        .dashboard-header h1 {
            display: inline-block;
            font-family: 'CWDangamAsac-Bold', sans-serif;
            color: #35ae5f;
            margin: 0;
        }
        .action-btns {
            position: absolute;
            top: 50%;
            right: 0;
            transform: translateY(-50%);
        }
        .action-btns a {
            font-size: 14px;
            color: #fff;
            background-color: #35ae5f;
            padding: 5px 10px;
            border-radius: 3px;
            text-decoration: none;
            margin-left: 5px;
        }
        .action-btns a.btn-edit {
            background-color: #5bc0de;
        }
        .action-btns a.btn-delete {
            background-color: #d9534f;
        }
        .card {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fefefe;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .word-list {
            list-style: none;
            padding: 0;
            font-size: 18px;
        }
        .word-list li {
            margin-bottom: 15px;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            color: #6f5340;
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
<jsp:include page="/include/nav.jsp" />
<body>
    <main class="container">
        <div class="dashboard-header">
            <h1>${category}</h1>
            <div class="action-btns">
                <a class="btn btn-edit" href="${ctp}/VocaEdit.st?idx=${vo.idx}">수정</a>
                <a class="btn btn-delete" href="${ctp}/VocaDelete.st?idx=${vo.idx}">삭제</a>
            </div>
        </div>
        
        <div class="card">
            <ul class="word-list">
                <c:forEach var="vo" items="${vos}" varStatus="st">
                    <li>
                        <strong>${vo.word}</strong> : 
                        <c:if test="${!empty vo.partOfSpeech}">
                            (${vo.partOfSpeech})
                        </c:if> 
                        ${vo.meaning}
                    </li>
                </c:forEach>
            </ul>

            <h3>단어 테스트</h3>
            <form action="${ctp}/vocabTest.jsp" method="GET">
                <!-- 테스트 시작 버튼 -->
                <button class="btn" type="submit">테스트 시작</button>
            </form>
        </div>
    </main>
    <!-- Footer-->
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${ctp}/js/scripts.js"></script>
</body>
</html>

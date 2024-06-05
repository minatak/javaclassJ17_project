<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 테스트</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <style>
        @font-face {
            font-family: 'CWDangamAsac-Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            border-radius: 8px;
        }
        .question {
            margin-bottom: 20px;
        }
        h1 {
            font-family: 'CWDangamAsac-Bold';
            color: #36b574;
            text-align: center;
        }
        .question h5 {
            font-family: 'NEXON Lv1 Gothic OTF';
            color: #6f5340;
        }
        .btn {
            text-align: right;
            padding: 10px 15px;
            background-color: #35ae5f;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }
        .btn:hover {
            color: #fff;
            background-color: #379866;
        }
    </style>
    <script>
        function validateForm() {
            var inputs = document.querySelectorAll('input[name="userAnswer"]');
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value.trim() === "") {
                    alert("모든 단어에 대한 답변을 입력해주세요.");
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <div class="con">
        <p><br/></p>
        <main class="container">
            <h1 class="mb-5">단어 테스트</h1>
            <form action="VocaTestResult.st" method="POST" onsubmit="return validateForm();">
                <c:forEach var="vo" items="${vos}" varStatus="st" begin="0" end="${questionCount-1}">
                    <div class="question">
                        <h5>${st.index + 1}. ${vo.word}</h5>
                        <input type="hidden" name="words" value="${vo.word}" />
                        <input type="hidden" name="correctMeaning" value="${vo.meaning}" />
                        <input type="hidden" name="category" value="${vo.category}" />
                        <input type="hidden" name="wordMid" value="${vo.memberMid}" />
                        <input type="text" name="userAnswer" class="form-control" />
                    </div>
                </c:forEach>
                <div class="text-right">
                    <button type="submit" class="btn">제출</button>
                </div>
            </form>
        </main>
        <p><br/></p>
    </div>
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

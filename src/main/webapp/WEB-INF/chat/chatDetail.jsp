<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="common.Translator" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅 상세</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="${ctp}/css/chat.css" rel="stylesheet" />
    <script>
        function translateMessage(messageId) {
            // AJAX 요청을 통해 서버에서 번역 수행
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "${ctp}/Translator.java", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    const translatedText = xhr.responseText;
                    document.getElementById('message-' + messageId).textContent = translatedText;
                }
            };
            const messageText = document.getElementById('message-' + messageId).textContent;
            xhr.send("text=" + encodeURIComponent(messageText) + "&messageId=" + messageId);
        }
    </script>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container chat-detail-container mt-5 mb-5">
        <h1>채팅 상세</h1>
        <c:forEach var="message" items="${vos}">
            <div class="message-item">
                <p id="message-${vo.id}">${vo.text}</p>
                <span class="translate-btn" onclick="translateMessage(${vo.id})">번역하기</span>
            </div>
        </c:forEach>
        <form name="sendMessageForm" method="post" action="${ctp}/sendMessage.chat">
            <div class="form-group">
                <label for="messageText">메시지 보내기</label>
                <textarea id="messageText" name="messageText" class="form-control" placeholder="메시지를 입력하세요" required></textarea>
            </div>
            <div class="form-group text-center">
                <input type="submit" value="보내기" class="myBtn">
            </div>
        </form>
    </div>
</main>
<jsp:include page="/include/footer.jsp" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
